terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.55.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.3.0"
    }
  }

  # Adding Backend as S3 for Remote State file Storage
  backend "s3" {
    bucket = "test-bucket-myapp"
    key    = "state-file/ec2-file-tfstate/terraform.tfstate"

    region = "us-west-2"

    # Enable during Step-09     
    # For State Locking
    dynamodb_table = "ec2-table-terraform"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-west-2"

}

