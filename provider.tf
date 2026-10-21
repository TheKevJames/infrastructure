# Ephemeral, so the token never reaches state, which the plan identity can read.
ephemeral "google_secret_manager_secret_version" "cloudflare" {
  secret = var.cloudflare_token_secret
}

provider "cloudflare" {
  api_token = ephemeral.google_secret_manager_secret_version.cloudflare.secret_data
}

provider "google" {
  project = "thekevjames-175823"
  region  = "us-central1"
}
