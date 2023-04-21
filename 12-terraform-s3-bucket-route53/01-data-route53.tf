# get the hosted zone id and name in route53

data "aws_route53_zone" "myzone" {
  name         = "jasmeetdevops.com"
}

# output for the id of the hosted zone

output "hosted_zone_id" {
  description = "Hosted Zone id of the desired Hosted Zone"
  value       = data.aws_route53_zone.myzone.zone_id
}


# name of the hosted zone 
output "hosted_zone_name" {
  description = "Hosted Zone name of the desired Hosted Zone"
  value       = data.aws_route53_zone.myzone.name
}