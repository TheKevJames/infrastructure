terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "4.30.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "5.26.0"
    }
  }
  required_version = ">= 0.14"
}
