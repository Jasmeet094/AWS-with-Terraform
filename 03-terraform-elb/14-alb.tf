module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 8.0"
  depends_on = [module.private_instance ]
  name = "alb-test"

  load_balancer_type = "application"

  vpc_id             = module.vpc.vpc_id
  subnets            = module.vpc.public_subnets
  security_groups    =[module.alb_sg.security_group_id]

  # target groups to be attached 

  target_groups = [
    {
      name_prefix      = "mytg-"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
      # targets = {
      #   my_target1 = {
      #     target_id =   element(module.private_instance.id,[0])
      #     port = 80
      #   }
      #   my_target2 = {
      #     target_id =  element(module.private_instance.id,[1])
      #     port = 80
      #   }
      # }
      targets = {
      for instance_name in var.instance-name :
      "my_target_${instance_name}" => {
        target_id = module.private_instance[instance_name].id
        port      = 80
      }  
      }
      
      }
  ] 
  
  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]

  tags = {
    terraform = "yes"
  }
}