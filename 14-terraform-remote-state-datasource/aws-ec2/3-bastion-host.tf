# bastion host from which we'll ssh to our private servers

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "bastion-host"

  ami                    = data.aws_ami.amzn-ami.id
  instance_type          = var.instance-type
  key_name               = var.key
  vpc_security_group_ids = [data.terraform_remote_state.vpc.outputs.vpc-security_group_id]
  subnet_id              = "${data.terraform_remote_state.vpc.outputs.public_subnets[0]}"


  tags = {
    Terraform   = "true"
    Environment = "test"
  }
}