resource "cloudflare_record" "base" {
    domain = "${var.cloudflare_domain}"
    name = "@"
    value = "54.68.57.73"
    type = "A"
}

resource "cloudflare_record" "devstat" {
    domain = "${var.cloudflare_domain}"
    name = "devstat"
    value = "${var.cloudflare_domain}"
    type = "CNAME"
}

resource "cloudflare_record" "devstat_api" {
    domain = "${var.cloudflare_domain}"
    name = "api.devstat"
    value = "${var.cloudflare_domain}"
    type = "CNAME"
}

resource "cloudflare_record" "email" {
    domain = "${var.cloudflare_domain}"
    name = "email"
    value = "mailgun.org"
    type = "CNAME"
}

resource "cloudflare_record" "jarvis" {
    domain = "${var.cloudflare_domain}"
    name = "jarvis"
    value = "${var.cloudflare_domain}"
    type = "CNAME"
}

resource "cloudflare_record" "league" {
    domain = "${var.cloudflare_domain}"
    name = "league"
    value = "${var.cloudflare_domain}"
    type = "CNAME"
}

resource "cloudflare_record" "netdata" {
    domain = "${var.cloudflare_domain}"
    name = "netdata"
    value = "${var.cloudflare_domain}"
    type = "CNAME"
}

resource "cloudflare_record" "status" {
    domain = "${var.cloudflare_domain}"
    name = "status"
    value = "${var.cloudflare_domain}"
    type = "CNAME"
}

resource "cloudflare_record" "www" {
    domain = "${var.cloudflare_domain}"
    name = "www"
    value = "${var.cloudflare_domain}"
    type = "CNAME"
}

resource "cloudflare_record" "youshouldread" {
    domain = "${var.cloudflare_domain}"
    name = "youshouldread"
    value = "${var.cloudflare_domain}"
    type = "CNAME"
}

resource "cloudflare_record" "youshouldread_api" {
    domain = "${var.cloudflare_domain}"
    name = "api.youshouldread"
    value = "${var.cloudflare_domain}"
    type = "CNAME"
}

resource "cloudflare_record" "ysr" {
    domain = "${var.cloudflare_domain}"
    name = "ysr"
    value = "${var.cloudflare_domain}"
    type = "CNAME"
}

resource "cloudflare_record" "ysr_api" {
    domain = "${var.cloudflare_domain}"
    name = "api.ysr"
    value = "${var.cloudflare_domain}"
    type = "CNAME"
}
