# Outputs related to bucket

output "arn" {
  description = "ARN of the S3 Bucket"
  value       = aws_s3_bucket.test_bucket.arn
}

output "name" {
  description = "Name (id) of the bucket"
  value       = aws_s3_bucket.test_bucket.id
}

output "domain" {
  description = "Domain Name of the bucket"
  value       = aws_s3_bucket_website_configuration.website_conf.website_domain
}

output "endpoint" {
  description = "Endpoint Information of the bucket"
  value       = aws_s3_bucket_website_configuration.website_conf.website_endpoint
}