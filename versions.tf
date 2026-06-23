terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "5.21.1"
    }
    google = {
      source  = "hashicorp/google"
      version = "7.37.0"
    }
  }
  required_version = ">= 0.14"
}
