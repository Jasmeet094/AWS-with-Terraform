# variables which will be load automattically at terraform apply 

vpc-cidr        = "10.0.0.0/16"
az-vpc          = ["us-west-2a", "us-west-2b"]
public-subnet   = ["10.0.101.0/24", "10.0.102.0/24"]
private-subnet  = ["10.0.1.0/24", "10.0.2.0/24"]
database-subnet = ["10.0.151.0/24", "10.0.152.0/24"]



