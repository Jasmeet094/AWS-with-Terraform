# Terraform Remote State Datasource
data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "test-bucket-myapp"
    key    = "state-file/vpc-statefile/terraform.tfstate"
    region = "us-west-2"
  }
}


