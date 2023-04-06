# create vpc with public and private subnets

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.19.0"
  name    = "${var.vpc_name}-${local.name}"
  cidr    = var.vpc_cidr

  azs             = var.az-vpc
  private_subnets = var.vpc_private_subnet
  public_subnets  = var.vpc_public_subnet

  enable_nat_gateway = true
  enable_dns_support = true
  single_nat_gateway = true
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}