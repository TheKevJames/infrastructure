terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "4.47.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "6.12.0"
    }
  }
  required_version = ">= 0.14"
}
