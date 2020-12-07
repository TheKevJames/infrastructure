provider "cloudflare" {
  version = "2.14.0"

  email   = var.cloudflare_email
  api_key = var.cloudflare_token
}

provider "google" {
  version = "3.50.0"

  project = "thekevjames-175823"
  region  = "us-central1"
}
