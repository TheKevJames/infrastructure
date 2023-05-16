terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "4.5.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "4.65.2"
    }
  }
  required_version = ">= 0.14"
}
