terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "5.9.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "7.1.0"
    }
  }
  required_version = ">= 0.14"
}
