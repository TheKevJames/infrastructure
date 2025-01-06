terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "4.49.1"
    }
    google = {
      source  = "hashicorp/google"
      version = "6.15.0"
    }
  }
  required_version = ">= 0.14"
}
