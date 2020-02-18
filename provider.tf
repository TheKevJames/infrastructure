provider "cloudflare" {
  version = "1.18.1"

  email = "${var.cloudflare_email}"
  token = "${var.cloudflare_token}"
}

provider "google" {
  version = "1.20.0"

  project = "thekevjames-175823"
  region  = "us-central1"
}
