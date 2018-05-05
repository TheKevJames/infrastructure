provider "cloudflare" {
  email = "${var.cloudflare_email}"
  token = "${var.cloudflare_token}"
}

provider "google" {
  project = "${var.google_project_id}"
  region  = "${var.google_region}"
}
