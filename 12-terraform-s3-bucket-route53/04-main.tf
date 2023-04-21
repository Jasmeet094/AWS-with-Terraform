# s3 bucket configuration , creation of bucket
resource "aws_s3_bucket" "test_bucket" {
  bucket = var.bucket_name
  force_destroy = true
  tags = var.tags
}

# Bucket policy to allow public access --> attaching the policy
resource "aws_s3_bucket_policy" "policy_public_access" {
  bucket = aws_s3_bucket.test_bucket.id
  depends_on = [aws_s3_bucket.test_bucket]
  policy = templatefile("05-bucket-policy.tftpl", {name = var.bucket_name })
}

# Allow object ownership
resource "aws_s3_bucket_ownership_controls" "my-ownership" {
  bucket = aws_s3_bucket.test_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"  
  }
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
  depends_on = [
    aws_s3_bucket_ownership_controls.my-ownership,
    aws_s3_bucket_public_access_block.public_acl,
  ]

  bucket = aws_s3_bucket.test_bucket.id
  acl    = "public-read"
}


# Upload object into S3 --> upload index.html into s3 
resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.test_bucket.id
  key    = "index.html"
  source = "06-index.html"
  acl    = "public-read"
  content_type = "text/html"
}

# s3 static website host configration which Provides an S3 bucket website configuration resource
resource "aws_s3_bucket_website_configuration" "website_conf" {
  bucket = aws_s3_bucket.test_bucket.id
  depends_on = [
    aws_s3_bucket.test_bucket, aws_s3_bucket_public_access_block.public_acl , aws_s3_bucket_acl.acl , 
    aws_s3_bucket_policy.policy_public_access
  ]
  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

}
