# bastion host 
module "ec2-bastion-host" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.3.0"
  
  name = "bastion-host"
  ami                         = data.aws_ami.amzlinux2.id
  instance_type               = var.instance_type
  subnet_id                   = element(module.vpc.public_subnets, 0)
  vpc_security_group_ids      = [module.bastion-security-group.security_group_id]
  key_name = var.instance_keypair
  tags = local.common_tags
}