# private instances to be launched in private subnets

module "private_app1" {
  source     = "terraform-aws-modules/ec2-instance/aws"
  version    = "~> 3.0"
  for_each   = toset(var.private-app1)
  name       = each.key
  depends_on = [module.vpc]

  ami                    = data.aws_ami.amzn-ami.id
  instance_type          = var.instance-type
  key_name               = var.key
  user_data              = file("${path.module}/15-user-data-app1.sh")
  vpc_security_group_ids = [module.private_sg.security_group_id]
  subnet_id              = element(module.vpc.private_subnets, index(var.private-app1, each.key))

  tags = {
    Terraform   = "true"
    Environment = local.department
  }
}