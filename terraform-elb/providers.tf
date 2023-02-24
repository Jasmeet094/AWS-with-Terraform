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
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region

}

