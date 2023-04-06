# variables used for instances 

variable "instance-type" {
  type    = string
  default = "t2.micro"
}


variable "key" {
  type    = string
  default = "terraform-key"
}

# names for private ec2 for app1

variable "private-app1" {
  type    = list(string)
  default = ["private-app1-A", "private-app1-B"]
}

# names for private ec2 for app2

variable "private-app2" {

  type    = list(string)
  default = ["private-app2-A", "private-app2-B"]

}