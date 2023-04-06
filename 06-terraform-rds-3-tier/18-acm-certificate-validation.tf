# Creates and validate a SSL certificate for our domain
module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> 4.0"

  domain_name = data.aws_route53_zone.myzone.name
  zone_id     = data.aws_route53_zone.myzone.zone_id

  subject_alternative_names = [
    "*.jasmeetdevops.com"

  ]

  wait_for_validation = true

  tags = {
    Terraform = "true"
    Name      = local.name
  }
}

# Output ACM Certificate ARN
output "acm_certificate_arn" {
  description = "The ARN of the certificate"
  value       = module.acm.acm_certificate_arn
}