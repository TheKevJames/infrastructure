terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "3.17.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "4.27.0"
    }
  }
  required_version = ">= 0.14"
}
