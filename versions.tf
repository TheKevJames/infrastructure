terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "5.23.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "7.44.0"
    }
  }
  required_version = ">= 0.14"
}
