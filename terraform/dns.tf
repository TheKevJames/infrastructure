resource "cloudflare_record" "base" {
  domain = "${var.cloudflare_domain}"
  name   = "@"
  type   = "A"

  proxied = false

  value = "${google_compute_address.gcebox.address}"
}

resource "cloudflare_record" "www" {
  domain = "${var.cloudflare_domain}"
  name   = "www"
  type   = "CNAME"

  proxied = false

  value = "${var.cloudflare_domain}"
}
