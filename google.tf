resource "cloudflare_dns_record" "verify" {
  zone_id = var.zone
  name    = "@"
  type    = "TXT"
  ttl     = 1

  content = "google-site-verification=PPSJKE8kBVcIcPxcZ-zab7cAdNHJBp59vrkNgzMWpvs"
}
