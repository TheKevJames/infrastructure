terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "4.11.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "4.75.1"
    }
  }
  required_version = ">= 0.14"
}
