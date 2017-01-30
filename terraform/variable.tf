variable "cloudflare_email" {}
variable "cloudflare_token" {}

variable "cloudflare_domain" {
    default = "thekev.in"
}
variable "cloudflare_dkim" {
    default = "k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCT7TjG15xvCb7Bl1gAF8VrSHr4paJqkJLiGv+Q9YMVQO9+c8MAwGQcLTxiiMNY52jFcjhPIeg0OZOR+ORfKlxUQHCj1EzqQWoTCcV95RKwCudi2duh4Wqv+sZkqs//FRX0fEIdBS5K79vDftkWgeKqtbiskHa+eVxdMj6aPIDMrwIDAQAB"
}
