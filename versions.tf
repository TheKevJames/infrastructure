terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "4.7.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "4.67.0"
    }
  }
  required_version = ">= 0.14"
}
