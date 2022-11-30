terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "3.29.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "4.44.1"
    }
  }
  required_version = ">= 0.14"
}
