terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "5.10.1"
    }
    google = {
      source  = "hashicorp/google"
      version = "7.5.0"
    }
  }
  required_version = ">= 0.14"
}
