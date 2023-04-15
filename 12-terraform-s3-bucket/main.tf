# s3 bucket configuration
resource "aws_s3_bucket" "test_bucket" {
  bucket = var.bucket_name
  force_destroy = true
  tags = var.tags
}

# Bucket policy to allow public access
resource "aws_s3_bucket_policy" "policy_public_access" {
  bucket = aws_s3_bucket.test_bucket.id
  policy = templatefile("bucket-policy.tftpl", {name = var.bucket_name })
}


# Allow all public access settings
resource "aws_s3_bucket_public_access_block" "public_acl" {
  bucket = aws_s3_bucket.test_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# Grant Public access to bucket and objects using ACL
resource "aws_s3_bucket_acl" "acl" {
  depends_on = [aws_s3_bucket_public_access_block.public_acl]

  bucket = aws_s3_bucket.test_bucket.id
  acl    = "public-read"
}

# s3 static website host configration which Provides an S3 bucket website configuration resource
resource "aws_s3_bucket_website_configuration" "website_conf" {
  bucket = aws_s3_bucket.test_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}