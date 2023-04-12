# values for tags used in local.tf file
locals {
  Name = "jasmeet-test"
}

locals {
  # Common tags to be assigned to all resources
  common_tags = {
    Environment = "dev"
    Department  = "devops"
    Terraform   = "True"
  }
}