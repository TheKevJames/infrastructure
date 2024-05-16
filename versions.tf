terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "4.33.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "5.29.1"
    }
  }
  required_version = ">= 0.14"
}
