resource "cloudflare_record" "base" {
  domain = "${var.domain}"
  name   = "@"
  type   = "CNAME"

  proxied = true

  value = "c.storage.googleapis.com"
}

resource "cloudflare_record" "www" {
  domain = "${var.domain}"
  name   = "www"
  type   = "CNAME"

  proxied = true

  value = "${var.domain}"
}
