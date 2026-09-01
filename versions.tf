terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "5.24.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "8.1.0"
    }
  }
  required_version = ">= 0.14"
}
