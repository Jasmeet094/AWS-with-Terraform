
# AWS S3 Static Website Using s3 resource Terraform & Route53 DNS

In this project we are going to create aws s3 static website using terraform aws s3 resource and using Route53 we are using `jasmeetdevops.com` to access out static website endpoint . We are using `TemplateFile` function to insert bucket policy to bucket. In `main.tf` file we are creating 5 resources related to our bucket.

1. First is s3 bucket itself
2. Second is s3 bucket policy resource to insert/attach policy to bucket using `Templatefile` function.
3. Adding Object ownership to bucket owner
4. To allow all public access we are using `public_access_block`.
5. For static website related we are using `website_configuration`.
6. Also using aws_s3_object resource to upload `index.html` file to s3.
7. Finally to give public read access we are also creating `bucket_acl` resource.

-------------------------------------------------------------------

[AWS](https://docs.aws.amazon.com/s3/index.html) | [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#attributes-reference)

-------------------------------------------------------------------





## Documentation of Terraform files 

1. bucket-policy.tftpl = `This file contains the bucket policy which is allowing to access our bucket from all world`

2. main.tf = `Main configuration file for s3 bucket.`

3. outputs.tf = `outputs like bucket arn , website domain etc`

4. provider.tf = `Terraform and aws providers file`

5. variables.auto.tfvars = `auto loaded variables`

6. variables.tf = `variables used for bucket`

7. route53-to-s3.tf = `We are creating a record of type A in our hosted zone and using Alias redirecting the traffic to website endpoint`