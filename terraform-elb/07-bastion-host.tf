# bastion host used to connect to our private instances in private subnets

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "bastion-host"


  ami                    = data.aws_ami.amzn-ami.id
  instance_type          = var.instance-type
  key_name               = var.key-name
  vpc_security_group_ids = [module.bastion-sg.security_group_id]
  subnet_id              = element(module.vpc.public_subnets, 0)

  tags = {
    Terraform = "true"
    env       = local.environment
  }
}