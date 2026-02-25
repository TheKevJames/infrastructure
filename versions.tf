terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "5.17.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "7.21.0"
    }
  }
  required_version = ">= 0.14"
}
