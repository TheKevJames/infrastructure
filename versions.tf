terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "4.45.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "6.11.0"
    }
  }
  required_version = ">= 0.14"
}
