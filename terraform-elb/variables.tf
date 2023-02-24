# AWS Region
variable "aws_region" {
  default = "us-west-2"
  type    = string
}

variable "environment" {
  default = "testing"
  type    = string
}

variable "department" {
  default = "devops"
  type    = string
}
