provider "cloudflare" {
  version = "~> 1.0"

  email   = "${var.cloudflare_email}"
  token   = "${var.cloudflare_token}"
}

provider "google" {
  version = "~> 1.0"

  project = "${var.google_project_id}"
  region  = "${var.google_region}"
}
