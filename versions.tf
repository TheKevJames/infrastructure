terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "4.20.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "5.9.0"
    }
  }
  required_version = ">= 0.14"
}
