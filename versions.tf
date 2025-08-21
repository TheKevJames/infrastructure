terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "5.8.4"
    }
    google = {
      source  = "hashicorp/google"
      version = "6.49.1"
    }
  }
  required_version = ">= 0.14"
}
