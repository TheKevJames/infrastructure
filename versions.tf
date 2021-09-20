terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "2.27.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "3.54.0"
    }
  }
  required_version = ">= 0.14"
}
