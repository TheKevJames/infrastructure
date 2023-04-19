terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "4.4.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "4.62.1"
    }
  }
  required_version = ">= 0.14"
}
