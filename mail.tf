resource "cloudflare_record" "email" {
  zone_id = var.zone
  name    = "email"
  type    = "CNAME"

  proxied = false

  value = "mailgun.org"
}

resource "cloudflare_record" "dkim" {
  zone_id = var.zone
  name    = "krs._domainkey"
  type    = "TXT"

  value = "k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCT7TjG15xvCb7Bl1gAF8VrSHr4paJqkJLiGv+Q9YMVQO9+c8MAwGQcLTxiiMNY52jFcjhPIeg0OZOR+ORfKlxUQHCj1EzqQWoTCcV95RKwCudi2duh4Wqv+sZkqs//FRX0fEIdBS5K79vDftkWgeKqtbiskHa+eVxdMj6aPIDMrwIDAQAB"
}

resource "cloudflare_record" "spf" {
  zone_id = var.zone
  name    = "@"
  type    = "TXT"

  value = "v=spf1 include:mailgun.org ~all"
}

resource "cloudflare_record" "mxa" {
  zone_id = var.zone
  name    = "@"
  type    = "MX"

  priority = 10
  value    = "mxa.mailgun.org"
}

resource "cloudflare_record" "mxb" {
  zone_id = var.zone
  name    = "@"
  type    = "MX"

  priority = 10
  value    = "mxb.mailgun.org"
}
