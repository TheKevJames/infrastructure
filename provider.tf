provider "cloudflare" {
  email   = var.cloudflare_email
  api_key = var.cloudflare_token
}

provider "google" {
  project = "thekevjames-175823"
  region  = "us-central1"
}
