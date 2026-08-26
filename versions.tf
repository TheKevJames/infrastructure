terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "5.24.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "7.46.0"
    }
  }
  required_version = ">= 0.14"
}
