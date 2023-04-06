# ec2 instance for app3 to run User Management Application

module "private_app3" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"
  name    = "user-management-app-ec2"
  depends_on = [
    module.vpc,
    module.rds_db
  ]


  ami                    = data.aws_ami.amzn-ami.id
  instance_type          = var.instance-type
  key_name               = var.key
  user_data              = templatefile("app3-uma-install.tftpl", { rds_db_endpoint = module.rds_db.db_instance_address })
  vpc_security_group_ids = [module.private_sg.security_group_id]
  subnet_id              = element(module.vpc.private_subnets, 0)

  tags = {
    Terraform   = "true"
    Environment = local.department
  }
}
