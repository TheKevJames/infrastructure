terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "3.12.2"
    }
    google = {
      source  = "hashicorp/google"
      version = "4.15.0"
    }
  }
  required_version = ">= 0.14"
}
