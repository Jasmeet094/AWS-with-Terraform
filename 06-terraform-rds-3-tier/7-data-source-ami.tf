# get the latest AWS Ami 

data "aws_ami" "amzn-ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-gp2"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}



# data "aws_ami" "amzn-ami" {
#   most_recent = true

#   filter {
#     name   = "image-id"
#     values = ["ami-07f3ef11ec14a1ea3"]
#   }
# }