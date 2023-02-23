# AWS EC2 Instance Type
variable "instance_type" {
  description = "EC2 Instance Type"
  type = string
  default = "t2.micro"  
}

# AWS EC2 Instance Key Pair
variable "instance_keypair" {
  description = "AWS EC2 Key pair"
  type = string
  default = "terraform-key"
}

variable "instance_count" {
  type = list
  default = ["private-ec2-1","private-ec2-2"]

}