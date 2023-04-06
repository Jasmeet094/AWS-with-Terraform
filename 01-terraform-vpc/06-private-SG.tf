module "private-security-group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.17.1"

  #name for security group
  name   = "private-sg"
  vpc_id = module.vpc.vpc_id

  #ingress and egress (inbound and outbound traffic)
  ingress_cidr_blocks = [module.vpc.vpc_cidr_block]
  ingress_rules       = ["ssh-tcp","http-80-tcp"]

  egress_rules = ["all-all"]
  tags = local.common_tags

}