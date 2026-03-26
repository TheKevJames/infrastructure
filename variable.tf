variable "artifacts_url" {
  default = "https://storage.googleapis.com/thekevjames-artifacts"
  type    = string
}

variable "cloudflare_email" {
  type = string
}

variable "cloudflare_token" {
  sensitive = true
  type      = string
}

variable "domain" {
  default = "thekev.in"
  type    = string
}

variable "zone" {
  default = "b16202b6cdadb4d72e460f6c2be19fa7"
  type    = string
}
