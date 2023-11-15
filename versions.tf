terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "4.19.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "5.6.0"
    }
  }
  required_version = ">= 0.14"
}
