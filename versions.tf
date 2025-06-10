terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "5.5.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "6.39.0"
    }
  }
  required_version = ">= 0.14"
}
