# security group for bastion host 

module "bastion_sg" {
  source = "terraform-aws-modules/security-group/aws//modules/http-80"

  name        = "${local.name}-sg"
  description = "Security group for web-server with ssh ports open for world"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["ssh-tcp"]
  egress_rules        = ["all-all"]
  tags = {
    Terraform = "true"

  }
}