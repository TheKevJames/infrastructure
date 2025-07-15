terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "5.7.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "6.43.0"
    }
  }
  required_version = ">= 0.14"
}
