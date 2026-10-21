# Identities used by this repo's own CI. Anyone who can push a branch can run
# arbitrary code with the plan identity (eg. via an `external` data source), so
# it must stay read-only and is treated as public; only master gets apply.
locals {
  terraform_planner = "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.github.name}/attribute.repository/TheKevJames/infrastructure"
  terraform_applier = "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.github.name}/attribute.repo_ref/TheKevJames/infrastructure@refs/heads/master"

  terraform_plan_roles = toset([
    "roles/iam.securityReviewer",
    "roles/iam.workloadIdentityPoolViewer",
    "roles/secretmanager.viewer",
    "roles/serviceusage.serviceUsageViewer",
  ])
}

resource "google_project_service" "iamcredentials" {
  service            = "iamcredentials.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "secretmanager" {
  service            = "secretmanager.googleapis.com"
  disable_on_destroy = false
}

resource "google_service_account" "terraform_plan" {
  account_id   = "terraform-plan"
  display_name = "Terraform plan (read-only, unreviewed branches)"
}

resource "google_service_account" "terraform_apply" {
  account_id   = "terraform-apply"
  display_name = "Terraform apply (master only)"
}

resource "google_service_account_iam_member" "terraform_plan_federation" {
  service_account_id = google_service_account.terraform_plan.name
  role               = "roles/iam.workloadIdentityUser"
  member             = local.terraform_planner
}

resource "google_service_account_iam_member" "terraform_apply_federation" {
  service_account_id = google_service_account.terraform_apply.name
  role               = "roles/iam.workloadIdentityUser"
  member             = local.terraform_applier
}

resource "google_project_iam_member" "terraform_plan" {
  for_each = local.terraform_plan_roles

  project = google_service_account.terraform_plan.project
  role    = each.key
  member  = google_service_account.terraform_plan.member
}

# Without a lock, plan never writes to the state bucket.
resource "google_storage_bucket_iam_member" "terraform_plan_state" {
  bucket = "thekevjames-terraform"
  role   = "roles/storage.objectViewer"
  member = google_service_account.terraform_plan.member
}

# This repo manages project IAM, so apply can always escalate to owner anyway.
resource "google_project_iam_member" "terraform_apply" {
  project = google_service_account.terraform_apply.project
  role    = "roles/owner"
  member  = google_service_account.terraform_apply.member
}

# Versions are added by hand (see README) and read through ephemeral
# resources, so token values never reach state, which the plan identity can
# read.
resource "google_secret_manager_secret" "cloudflare" {
  for_each = toset(["cloudflare-edit", "cloudflare-read"])

  secret_id = each.key
  replication {
    auto {}
  }

  depends_on = [google_project_service.secretmanager]
}

resource "google_secret_manager_secret_iam_member" "cloudflare_read" {
  secret_id = google_secret_manager_secret.cloudflare["cloudflare-read"].id
  role      = "roles/secretmanager.secretAccessor"
  member    = google_service_account.terraform_plan.member
}

resource "google_secret_manager_secret_iam_member" "cloudflare_edit" {
  secret_id = google_secret_manager_secret.cloudflare["cloudflare-edit"].id
  role      = "roles/secretmanager.secretAccessor"
  member    = google_service_account.terraform_apply.member
}
