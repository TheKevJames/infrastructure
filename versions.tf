terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "5.15.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "7.15.0"
    }
  }
  required_version = ">= 0.14"
}
