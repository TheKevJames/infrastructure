terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "3.33.1"
    }
    google = {
      source  = "hashicorp/google"
      version = "4.53.1"
    }
  }
  required_version = ">= 0.14"
}
