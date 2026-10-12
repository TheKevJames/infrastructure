locals {
  # GitHub OIDC subjects for pushes to the default branch of each repo.
  cv_deployer  = "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.github.name}/attribute.repo_ref/TheKevJames/cv@refs/heads/master"
  web_deployer = "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.github.name}/attribute.repo_ref/TheKevJames/web@refs/heads/master"
  web_buckets  = toset(["thekev.in", "thekevjames-artifacts", "www.thekev.in"])
}

resource "google_project_service" "sts" {
  service            = "sts.googleapis.com"
  disable_on_destroy = false
}

resource "google_iam_workload_identity_pool" "github" {
  workload_identity_pool_id = "github"
  display_name              = "GitHub Actions"
}

resource "google_iam_workload_identity_pool_provider" "github" {
  workload_identity_pool_id          = google_iam_workload_identity_pool.github.workload_identity_pool_id
  workload_identity_pool_provider_id = "github"
  display_name                       = "GitHub Actions"

  # Owner ID rather than name, so a renamed or re-registered account can't
  # mint tokens for this pool.
  attribute_condition = "assertion.repository_owner_id == '3341822'"
  # principalSet bindings can only match a single attribute, so repo_ref lets
  # grants be pinned to one branch of one repo; anyone who can push any branch
  # could otherwise deploy.
  attribute_mapping = {
    "google.subject"       = "assertion.sub"
    "attribute.repository" = "assertion.repository"
    "attribute.repo_ref"   = "assertion.repository + '@' + assertion.ref"
  }

  oidc {
    issuer_uri = "https://token.actions.githubusercontent.com"
  }
}

resource "google_storage_bucket_iam_member" "web_deployer" {
  for_each = local.web_buckets

  bucket = each.key
  role   = "roles/storage.objectUser"
  member = local.web_deployer
}

resource "google_storage_bucket_iam_member" "cv_deployer" {
  bucket = "thekevjames-artifacts"
  role   = "roles/storage.objectUser"
  member = local.cv_deployer
}

# `gcloud storage rsync` to a bucket root needs storage.buckets.get.
resource "google_storage_bucket_iam_member" "web_deployer_bucket_reader" {
  bucket = "thekev.in"
  role   = "roles/storage.legacyBucketReader"
  member = local.web_deployer
}
