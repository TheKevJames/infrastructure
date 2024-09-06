terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "4.41.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "6.1.0"
    }
  }
  required_version = ">= 0.14"
}
