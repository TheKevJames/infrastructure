terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "5.19.1"
    }
    google = {
      source  = "hashicorp/google"
      version = "7.35.0"
    }
  }
  required_version = ">= 0.14"
}
