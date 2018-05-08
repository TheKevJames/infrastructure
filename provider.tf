provider "cloudflare" {
  version = "~> 1.0"

  email = "${var.cloudflare_email}"
  token = "${var.cloudflare_token}"
}

provider "google" {
  version = "~> 1.0"

  project = "thekevjames-175823"
  region  = "us-central1"
}
