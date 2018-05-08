resource "cloudflare_record" "verify" {
  domain = "${var.cloudflare_domain}"
  name   = "@"
  type   = "TXT"

  value = "google-site-verification=PPSJKE8kBVcIcPxcZ-zab7cAdNHJBp59vrkNgzMWpvs"
}
