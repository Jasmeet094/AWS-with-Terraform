# create aws vpc and related stuff

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = var.vpc_cidr

  azs             = var.az-vpc
  private_subnets = var.vpc_private_subnet
  public_subnets  = var.vpc_public_subnet

  enable_nat_gateway = true
  enable_vpn_gateway = true
  single_nat_gateway = true

   # Database Subnets
  database_subnets = var.vpc_database_subnets
  create_database_subnet_group = var.vpc_create_database_subnet_group
  create_database_subnet_route_table = var.vpc_create_database_subnet_route_table

  tags = {
    Terraform   = "true"
    Environment = var.env
  }
}