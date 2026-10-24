terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "5.28.1"
    }
    google = {
      source  = "hashicorp/google"
      version = "8.8.1"
    }
  }
  required_version = ">= 0.14"
}
