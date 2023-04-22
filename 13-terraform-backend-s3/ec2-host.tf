# bastion host used to connect to our private instances in private subnets

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "test-host"


  ami           = data.aws_ami.amzn-ami.id
  instance_type = "t3.micro"
  key_name      = "terraform-key"

  tags = {
    Terraform = "true"
    env       = "test"
  }
}