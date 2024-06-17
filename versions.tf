terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "4.35.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "5.34.0"
    }
  }
  required_version = ">= 0.14"
}
