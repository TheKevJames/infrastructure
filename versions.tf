terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "2.17.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "3.69.0"
    }
  }
  required_version = ">= 0.14"
}
