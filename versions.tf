terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "4.26.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "5.20.0"
    }
  }
  required_version = ">= 0.14"
}
