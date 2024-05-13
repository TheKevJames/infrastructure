terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "4.32.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "5.29.0"
    }
  }
  required_version = ">= 0.14"
}
