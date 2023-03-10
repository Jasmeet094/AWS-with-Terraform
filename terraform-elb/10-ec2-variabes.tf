# update values as per requirements for ec2 instances 

variable "instance-type" {
  type    = string
  default = "t2.micro"
}

variable "key-name" {
  type    = string
  default = "terraform-key"
}

variable "instance-name" {
  type = list(string)
  default = ["private1","private2"]  
}