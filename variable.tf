variable "artifacts_url" {
  default = "https://storage.googleapis.com/thekevjames-artifacts"
  type    = string
}

# Plan's identity can only read cloudflare-read; apply overrides this.
variable "cloudflare_token_secret" {
  default = "cloudflare-read"
  type    = string
}

variable "domain" {
  default = "thekev.in"
  type    = string
}

variable "zone" {
  default = "b16202b6cdadb4d72e460f6c2be19fa7"
  type    = string
}
