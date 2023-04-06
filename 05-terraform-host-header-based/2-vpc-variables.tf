# change the values of variables as per rquirements in 04-vpc.auto.tfvars file

variable "vpc_cidr" {
  type = string

}

variable "az-vpc" {
  type        = list(string)
  description = "availability zones for vpc"
}

variable "vpc_public_subnet" {
  type = list(string)

}

variable "vpc_private_subnet" {
  type = list(string)

}

# VPC Database Subnets
variable "vpc_database_subnets" {
  description = "VPC Database Subnets"
  type = list(string)
  
}

# VPC Create Database Subnet Group (True / False)
variable "vpc_create_database_subnet_group" {
  description = "VPC Create Database Subnet Group"
  type = bool
  
}

# VPC Create Database Subnet Route Table (True or False)
variable "vpc_create_database_subnet_route_table" {
  description = "VPC Create Database Subnet Route Table"
  type = bool
  
}

