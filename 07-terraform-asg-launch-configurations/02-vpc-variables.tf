# variables for vpc

variable "az-vpc" {
  type = list(string)
  default = ["us-west-2a", "us-west-2b"]  
}

variable "vpc-cidr" {
  type = string
  default = "10.0.0.0/16"
}

variable "private-subnet" {
  type = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "public-subnet" {
  type = list(string)
  default = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "database-subnet" {
  type = list(string)
  default = ["10.0.151.0/24", "10.0.152.0/24"]
}



