terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "5.28.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "8.6.0"
    }
  }
  required_version = ">= 0.14"
}
