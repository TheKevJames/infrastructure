resource "cloudflare_record" "verify" {
  domain = "${var.domain}"
  name   = "@"
  type   = "TXT"

  value = "google-site-verification=PPSJKE8kBVcIcPxcZ-zab7cAdNHJBp59vrkNgzMWpvs"
}
