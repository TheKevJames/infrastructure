terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "5.18.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "7.23.0"
    }
  }
  required_version = ">= 0.14"
}
