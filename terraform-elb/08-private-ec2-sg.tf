# security group for private ec2 instances allowing traffic within vpc 

module "private-sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "private_sg"
  description = "Security group allowing traffic within vpc"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = [module.vpc.vpc_cidr_block]
  ingress_rules       = ["ssh-tcp", "http-80-tcp"]
  egress_rules        = ["all-all"]
  tags                = local.common_tags
}