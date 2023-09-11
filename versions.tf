terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "4.14.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "4.82.0"
    }
  }
  required_version = ">= 0.14"
}
