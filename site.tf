resource "cloudflare_dns_record" "base" {
  zone_id = var.zone
  name    = "@"
  type    = "CNAME"
  ttl     = 1

  proxied = true

  content = "c.storage.googleapis.com"
}

resource "cloudflare_dns_record" "www" {
  zone_id = var.zone
  name    = "www"
  type    = "CNAME"
  ttl     = 1

  proxied = true

  content = "c.storage.googleapis.com"
}

resource "cloudflare_page_rule" "redirect-cv" {
  zone_id  = var.zone
  target   = "${var.domain}/cv"
  priority = 1
  status   = "active"

  actions = {
    forwarding_url = {
      url         = "${var.artifacts_url}/cv.html"
      status_code = 301
    }
  }
}

resource "cloudflare_page_rule" "redirect-hexclock" {
  zone_id  = var.zone
  target   = "${var.domain}/hexclock"
  priority = 2
  status   = "active"

  actions = {
    forwarding_url = {
      url         = "${var.artifacts_url}/hexclock/hexclock.html"
      status_code = 301
    }
  }
}

resource "cloudflare_page_rule" "redirect-quotes" {
  zone_id  = var.zone
  target   = "${var.domain}/quotes"
  priority = 3
  status   = "active"

  actions = {
    forwarding_url = {
      url         = "${var.artifacts_url}/quotes/quotes.html"
      status_code = 301
    }
  }
}
