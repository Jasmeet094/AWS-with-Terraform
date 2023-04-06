# Register a record in Route53 for our domain jasmeetdevops.com


resource "aws_route53_record" "dns_app" {
  zone_id = data.aws_route53_zone.myzone.zone_id
  name    = "apps.jasmeetdevops.com"
  type    = "A"

  alias {
    name                   = module.alb.lb_dns_name
    zone_id                = module.alb.lb_zone_id
    evaluate_target_health = true
  }
}