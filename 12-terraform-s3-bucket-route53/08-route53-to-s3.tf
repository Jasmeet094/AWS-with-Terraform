# create a record in route53 to redirect traffic to s3 endpoint


resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.myzone.zone_id
  name    = var.domain_name
  depends_on = [aws_s3_bucket.test_bucket,aws_s3_bucket_website_configuration.website_conf]
  type    = "A"
  alias {
    name = aws_s3_bucket_website_configuration.website_conf.website_domain
    zone_id = aws_s3_bucket.test_bucket.hosted_zone_id
    evaluate_target_health = true
  }
}