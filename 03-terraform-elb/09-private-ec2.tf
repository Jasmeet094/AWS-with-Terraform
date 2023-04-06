# private ec2 instances in which application will be running

module "private_instance" {
  source     = "terraform-aws-modules/ec2-instance/aws"
  version    = "~> 3.0"
  depends_on = [module.vpc]
  for_each = toset(var.instance-name)
  name       = each.key


  ami                    = data.aws_ami.amzn-ami.id
  instance_type          = var.instance-type
  key_name               = var.key-name
  vpc_security_group_ids = [module.private-sg.security_group_id]
  user_data              = file("${path.module}/app-user-data.sh")
  subnet_id              = element(module.vpc.private_subnets, index(var.instance-name, each.key))
    
  

  tags = {
    Terraform = "true"
    env       = local.environment

  }
}
# for_each   = { for idx, name in local.instance-name : name => idx }
# If you are sure that you have 2 subnets in which you are deploying instances then use below string
#    element(module.vpc.private_subnets, each.value % 2) , this will ietrate/loop over 2 subnets

# Also if you want to lopp over all the subnets in module.vpc.priavte_subnets then you can use below 
#  element(module.vpc.private_subnets, each.value % length(module.vpc.private_subnets)) 
 