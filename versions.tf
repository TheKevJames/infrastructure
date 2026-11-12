terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "5.29.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "8.11.0"
    }
  }
  required_version = ">= 0.14"
}
