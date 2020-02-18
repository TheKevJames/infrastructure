resource "cloudflare_record" "verify" {
  zone_id = "${var.zone}"
  name    = "@"
  type    = "TXT"

  value = "google-site-verification=PPSJKE8kBVcIcPxcZ-zab7cAdNHJBp59vrkNgzMWpvs"
}
