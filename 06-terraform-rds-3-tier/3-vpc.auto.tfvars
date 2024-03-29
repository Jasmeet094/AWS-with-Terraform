# CHange values here for vpc related variables

vpc_cidr                               = "10.0.0.0/16"
az-vpc                                 = ["us-west-2a", "us-west-2b"]
vpc_public_subnet                      = ["10.0.1.0/24", "10.0.2.0/24"]
vpc_private_subnet                     = ["10.0.101.0/24", "10.0.102.0/24"]
vpc_database_subnets                   = ["10.0.151.0/24", "10.0.152.0/24"]
vpc_create_database_subnet_group       = true
vpc_create_database_subnet_route_table = true  