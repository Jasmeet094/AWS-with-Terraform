module "clb_test" {
  source  = "terraform-aws-modules/elb/aws"
  version = "4.0.0"

  name = "my-clb"
  depends_on = [
    module.loadbalancer_sg
  ]
  subnets         = module.vpc.public_subnets
  security_groups = [module.loadbalancer_sg.security_group_id]
  #internal        = false
  
  listener = [
    {
      instance_port     = 80
      instance_protocol = "HTTP"
      lb_port           = 80
      lb_protocol       = "HTTP"
    },
    {
      instance_port     = 8080
      instance_protocol = "http"
      lb_port           = 8080
      lb_protocol       = "http"
      #ssl_certificate_id = "arn:aws:acm:eu-west-1:235367859451:certificate/6c270328-2cd5-4b2d-8dfd-ae8d0004ad31"
    },
  ]

  health_check = {
    target              = "HTTP:80/"
    interval            = 30
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
  }

#   access_logs = {
#     bucket = "my-access-logs-bucket"
#   }

  // ELB attachments
  number_of_instances = var.count-in-elb
  instances           = module.private_instance[*].id

  tags = local.common_tags
}