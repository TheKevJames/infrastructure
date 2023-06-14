terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "4.8.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "4.69.1"
    }
  }
  required_version = ">= 0.14"
}
