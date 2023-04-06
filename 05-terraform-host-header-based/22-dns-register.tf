# Register a record in Route53 for our domain jasmeetdevops.com


resource "aws_route53_record" "dns_app1" {
  zone_id = data.aws_route53_zone.myzone.zone_id
  name    = var.dns_name_app1
  type    = "A"

  alias {
    name                   = module.alb.lb_dns_name
    zone_id                = module.alb.lb_zone_id
    evaluate_target_health = true
  }
}


resource "aws_route53_record" "dns_app2" {
  zone_id = data.aws_route53_zone.myzone.zone_id
  name    = var.dns_name_app2
  type    = "A"

  alias {
    name                   = module.alb.lb_dns_name
    zone_id                = module.alb.lb_zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "default_index" {
  zone_id = data.aws_route53_zone.myzone.zone_id
  name    = "myapps.jasmeetdevops.com"
  type    = "A"

  alias {
    name                   = module.alb.lb_dns_name
    zone_id                = module.alb.lb_zone_id
    evaluate_target_health = true
  }
}