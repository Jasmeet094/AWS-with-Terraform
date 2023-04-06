# security group for bastion host opened for SSH

module "bastion-sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "bastion_sg"
  description = "Security group open for world on port 22 - SSH"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["ssh-tcp"]
  egress_rules        = ["all-all"]
  tags                = local.common_tags
}