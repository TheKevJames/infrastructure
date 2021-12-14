terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "3.5.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "3.90.1"
    }
  }
  required_version = ">= 0.14"
}
