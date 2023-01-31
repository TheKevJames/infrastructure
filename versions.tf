terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "3.33.1"
    }
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }
  required_version = ">= 0.14"
}
