terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "4.2.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "4.58.0"
    }
  }
  required_version = ">= 0.14"
}
