terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "3.30.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "4.46.0"
    }
  }
  required_version = ">= 0.14"
}
