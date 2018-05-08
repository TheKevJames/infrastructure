resource "cloudflare_record" "email" {
  domain = "${var.domain}"
  name   = "email"
  type   = "CNAME"

  proxied = false

  value = "mailgun.org"
}

resource "cloudflare_record" "dkim" {
  domain = "${var.domain}"
  name   = "krs._domainkey"
  type   = "TXT"

  value = "k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCT7TjG15xvCb7Bl1gAF8VrSHr4paJqkJLiGv+Q9YMVQO9+c8MAwGQcLTxiiMNY52jFcjhPIeg0OZOR+ORfKlxUQHCj1EzqQWoTCcV95RKwCudi2duh4Wqv+sZkqs//FRX0fEIdBS5K79vDftkWgeKqtbiskHa+eVxdMj6aPIDMrwIDAQAB"
}

resource "cloudflare_record" "spf" {
  domain = "${var.domain}"
  name   = "@"
  type   = "TXT"

  value = "v=spf1 include:mailgun.org ~all"
}

resource "cloudflare_record" "mxa" {
  domain = "${var.domain}"
  name   = "@"
  type   = "MX"

  priority = 10
  value    = "mxa.mailgun.org"
}

resource "cloudflare_record" "mxb" {
  domain = "${var.domain}"
  name   = "@"
  type   = "MX"

  priority = 10
  value    = "mxb.mailgun.org"
}
