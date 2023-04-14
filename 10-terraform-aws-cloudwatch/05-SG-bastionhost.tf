module "bastion_sg" {
  source = "terraform-aws-modules/security-group/aws//modules/http-80"

  name        = "bastionhost-sg"
  description = "Security group for bastion host"
  vpc_id      = module.vpc.vpc_id

  ingress_rules       = ["ssh-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
  # Egress Rule - all-all open
  egress_rules = ["all-all"]
  tags         = local.common_tags
}


