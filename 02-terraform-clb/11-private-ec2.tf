# private ec2 instance host 
module "private_instance" {
  depends_on = [module.vpc]
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.3.0"
  count = length(var.instance_count)
  tags = {
    "Name" = var.instance_count[count.index]
  }
  ami                         = data.aws_ami.amzlinux2.id
  instance_type               = var.instance_type
  subnet_id = "${element(module.vpc.private_subnets, count.index)}"
  user_data = file("${path.module}/app1-user-data.sh")
  vpc_security_group_ids      = [module.private-security-group.security_group_id]
  key_name = var.instance_keypair
}


# variable "instance_count" {
#   type = list(string)
#   default = ["private-ec2-1","private-ec2-2"]

# 