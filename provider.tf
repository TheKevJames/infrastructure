provider "cloudflare" {
  version = "2.3.0"

  email   = "${var.cloudflare_email}"
  api_key = "${var.cloudflare_token}"
}

provider "google" {
  version = "1.20.0"

  project = "thekevjames-175823"
  region  = "us-central1"
}
