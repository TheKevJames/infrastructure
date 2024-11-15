terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "4.46.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "6.11.2"
    }
  }
  required_version = ">= 0.14"
}
