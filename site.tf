resource "cloudflare_record" "base" {
  zone_id = "${var.zone}"
  name    = "@"
  type    = "CNAME"

  proxied = true

  value = "c.storage.googleapis.com"
}

resource "cloudflare_record" "www" {
  zone_id = "${var.zone}"
  name    = "www"
  type    = "CNAME"

  proxied = true

  value = "c.storage.googleapis.com"
}

resource "cloudflare_page_rule" "redirect-cv" {
  zone_id  = "${var.zone}"
  target   = "${var.domain}/cv"
  priority = 1

  actions = {
    forwarding_url {
      url         = "${var.artifacts_url}/cv.pdf"
      status_code = 301
    }
  }
}

resource "cloudflare_page_rule" "redirect-hexclock" {
  zone_id  = "${var.zone}"
  target   = "${var.domain}/hexclock"
  priority = 2

  actions = {
    forwarding_url {
      url         = "${var.artifacts_url}/hexclock/hexclock.html"
      status_code = 301
    }
  }
}

resource "cloudflare_page_rule" "redirect-quotes" {
  zone_id  = "${var.zone}"
  target   = "${var.domain}/quotes"
  priority = 3

  actions = {
    forwarding_url {
      url         = "${var.artifacts_url}/quotes/quotes.html"
      status_code = 301
    }
  }
}
