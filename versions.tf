terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "4.3.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "4.61.0"
    }
  }
  required_version = ">= 0.14"
}
