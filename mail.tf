resource "cloudflare_dns_record" "email" {
  zone_id = var.zone
  name    = "email"
  type    = "CNAME"
  ttl     = 1

  proxied = false

  content = "mailgun.org"
}

resource "cloudflare_dns_record" "dkim" {
  zone_id = var.zone
  name    = "krs._domainkey"
  type    = "TXT"
  ttl     = 1

  content = "k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCT7TjG15xvCb7Bl1gAF8VrSHr4paJqkJLiGv+Q9YMVQO9+c8MAwGQcLTxiiMNY52jFcjhPIeg0OZOR+ORfKlxUQHCj1EzqQWoTCcV95RKwCudi2duh4Wqv+sZkqs//FRX0fEIdBS5K79vDftkWgeKqtbiskHa+eVxdMj6aPIDMrwIDAQAB"
}

resource "cloudflare_dns_record" "spf" {
  zone_id = var.zone
  name    = "@"
  type    = "TXT"
  ttl     = 1

  content = "v=spf1 include:mailgun.org ~all"
}

resource "cloudflare_dns_record" "mxa" {
  zone_id = var.zone
  name    = "@"
  type    = "MX"
  ttl     = 1

  priority = 10
  content  = "mxa.mailgun.org"
}

resource "cloudflare_dns_record" "mxb" {
  zone_id = var.zone
  name    = "@"
  type    = "MX"
  ttl     = 1

  priority = 10
  content  = "mxb.mailgun.org"
}
