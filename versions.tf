terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "4.48.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "6.13.0"
    }
  }
  required_version = ">= 0.14"
}
