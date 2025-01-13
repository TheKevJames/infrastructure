terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "4.50.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "6.16.0"
    }
  }
  required_version = ">= 0.14"
}
