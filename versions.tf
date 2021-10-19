terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "3.3.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "3.88.0"
    }
  }
  required_version = ">= 0.14"
}
