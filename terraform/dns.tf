resource "cloudflare_record" "base" {
  domain = "${var.cloudflare_domain}"
  name   = "@"
  type   = "A"

  proxied = false

  value = "${google_compute_address.gcebox.address}"
}

resource "cloudflare_record" "home" {
  domain = "${var.cloudflare_domain}"
  name   = "home"
  type   = "A"

  proxied = false

  value = "24.23.233.137"
}

resource "cloudflare_record" "jarvis" {
  domain = "${var.cloudflare_domain}"
  name   = "jarvis"
  type   = "CNAME"

  proxied = false

  value = "${var.cloudflare_domain}"
}

resource "cloudflare_record" "status" {
  domain = "${var.cloudflare_domain}"
  name   = "status"
  type   = "CNAME"

  proxied = false

  value = "stats.uptimerobot.com"
}

resource "cloudflare_record" "www" {
  domain = "${var.cloudflare_domain}"
  name   = "www"
  type   = "CNAME"

  proxied = false

  value = "${var.cloudflare_domain}"
}

resource "cloudflare_record" "youshouldread" {
  domain = "${var.cloudflare_domain}"
  name   = "youshouldread"
  type   = "CNAME"

  proxied = false

  value = "${var.cloudflare_domain}"
}

resource "cloudflare_record" "youshouldread_api" {
  domain = "${var.cloudflare_domain}"
  name   = "api.youshouldread"
  type   = "CNAME"

  proxied = false

  value = "${var.cloudflare_domain}"
}

resource "cloudflare_record" "ysr" {
  domain = "${var.cloudflare_domain}"
  name   = "ysr"
  type   = "CNAME"

  proxied = false

  value = "${var.cloudflare_domain}"
}

resource "cloudflare_record" "ysr_api" {
  domain = "${var.cloudflare_domain}"
  name   = "api.ysr"
  type   = "CNAME"

  proxied = false

  value = "${var.cloudflare_domain}"
}
