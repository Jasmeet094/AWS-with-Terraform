module "bastion-security-group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.17.1"

  #name for security group
  name   = "bastion-host-sg"
  vpc_id = module.vpc.vpc_id

  #ingress and egress (inbound and outbound traffic)
  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["ssh-tcp"]

  egress_rules  = ["all-all"]
  tags = local.common_tags

}

