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

# variable "vpc_name" {
#   type = string

# }

