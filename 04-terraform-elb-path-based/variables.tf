# common variables 

variable "aws-region" {
  default = "us-west-2"
  type    = string
}


variable "name" {
  default = "jasmeet"
  type    = string

}

variable "env" {
  default = "testing"
  type    = string
}

variable "department" {
  default = "devops"
  type    = string
}