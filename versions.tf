terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "4.38.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "5.39.1"
    }
  }
  required_version = ">= 0.14"
}
