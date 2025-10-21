terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "5.11.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "7.8.0"
    }
  }
  required_version = ">= 0.14"
}
