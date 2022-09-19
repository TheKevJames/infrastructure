terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "3.22.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "4.37.0"
    }
  }
  required_version = ">= 0.14"
}
