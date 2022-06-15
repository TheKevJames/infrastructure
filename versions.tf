terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "3.16.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "4.25.0"
    }
  }
  required_version = ">= 0.14"
}
