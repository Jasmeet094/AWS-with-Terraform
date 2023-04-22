
# Terraform Remote tfstate File Store and State Locking

In this demo we are going to store our tfstate file in AWS S3 so anyone in our team can have access to tfstate file and we are also using AWS Dynamo DB for state locking purpose. In `provider.tf` file i have used `backend` block to configure s3 and dynamo-db. We are creating a simple ec2 instance to test the s3 backend using ec2 module.



-------------------------------------------------------------------

[AWS](https://docs.aws.amazon.com/s3/index.html) | [Terraform](https://developer.hashicorp.com/terraform/language/settings/backends/configuration)

-------------------------------------------------------------------

