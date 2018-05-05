variable "cloudflare_email" {}
variable "cloudflare_token" {}

variable "cloudflare_domain" {
  default = "thekev.in"
}

variable "google_project_id" {
  default = "thekevjames-175823"
}

variable "google_region" {
  default = "us-central1"
}

variable "google_zone" {
  default = "us-central1-a"
}

variable "machine_type" {
  default = "n1-standard-1"
}

variable "image" {
  default = "debian-cloud/debian-9"
}
