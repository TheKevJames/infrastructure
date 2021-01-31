variable "cloudflare_email" {}
variable "cloudflare_token" {}
variable "poe_secret_key" {}
variable "poe_ssl_cert" {}
variable "poe_ssl_key" {}

variable "artifacts_url" {
  default = "https://storage.googleapis.com/thekevjames-artifacts"
}

variable "domain" {
  default = "thekev.in"
}

variable "zone" {
  default = "b16202b6cdadb4d72e460f6c2be19fa7"
}
