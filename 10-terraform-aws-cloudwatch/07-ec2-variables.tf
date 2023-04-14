# variables used for ec2 instances

variable "key" {
  type    = string
  default = "terraform-key"
}

variable "instance-type" {
  type    = string
  default = "t3.micro"
}

variable "region" {
  type    = string
  default = "us-west-2"
}
