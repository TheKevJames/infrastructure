resource "cloudflare_record" "dkim" {
    domain = "${var.cloudflare_domain}"
    name = "krs._domainkey"
    value = "${var.cloudflare_dkim}"
    type = "TXT"
}

resource "cloudflare_record" "spf" {
    domain = "${var.cloudflare_domain}"
    name = "@"
    value = "v=spf1 include:mailgun.org ~all"
    type = "TXT"
}
