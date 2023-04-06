# security group for private instances olny allow traffic within vpc

module "private_sg" {
  source = "terraform-aws-modules/security-group/aws//modules/http-80"

  name        = "${local.name}-private-sg"
  description = "Security group for private-servers with ssh and http ports open within vpc"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = [module.vpc.vpc_cidr_block]
  ingress_rules       = ["ssh-tcp", "http-80-tcp", "http-8080-tcp"]
  egress_rules        = ["all-all"]
  tags = {
    Terraform = "true"
    env       = var.env
  }
}