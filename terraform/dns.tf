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

resource "cloudflare_page_rule" "redirect-cv" {
  zone     = "${var.cloudflare_domain}"
  target   = "${var.cloudflare_domain}/cv"
  priority = 10

  actions = {
    forwarding_url {
      url = "${var.artifacts_url}/cv.pdf"
      status_code = 301
    }
  }
}

resource "cloudflare_page_rule" "redirect-hexclock" {
  zone     = "${var.cloudflare_domain}"
  target   = "${var.cloudflare_domain}/hexclock"
  priority = 10

  actions = {
    forwarding_url {
      url = "${var.artifacts_url}/hexclock/hexclock.html"
      status_code = 301
    }
  }
}

resource "cloudflare_page_rule" "redirect-quotes" {
  zone     = "${var.cloudflare_domain}"
  target   = "${var.cloudflare_domain}/quotes"
  priority = 10

  actions = {
    forwarding_url {
      url = "${var.artifacts_url}/quotes/quotes.html"
      status_code = 301
    }
  }
}

resource "cloudflare_page_rule" "redirect-quotes-json" {
  zone     = "${var.cloudflare_domain}"
  target   = "${var.cloudflare_domain}/quotes/json"
  priority = 10

  actions = {
    forwarding_url {
      url = "${var.artifacts_url}/quotes/quotes.html"
      status_code = 301
    }
  }
}
