# private ec2 instances in which application will be running

module "private_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"
  depends_on = [module.vpc]
  for_each = local.instance-name
  name     = each.key


  ami                    = data.aws_ami.amzn-ami.id
  instance_type          = var.instance-type
  key_name               = var.key-name
  vpc_security_group_ids = [module.private-sg.security_group_id]
  subnet_id               = element(module.vpc.private_subnets, each.key == "private-1" ? 0 : 1)
  tags = {
    Terraform = "true"
    env       = local.environment
  }
}