
## AWS Application Load Balancer with Terraform


## Documentation

[Terraform](https://registry.terraform.io/modules/terraform-aws-modules/alb/aws/latest) | [AWS-DOCS](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/introduction.html)

In this hands-on , we are going to create following aws resources :

1. AWS VPC with 2 public & private subnets
2. Nat Gateway
3. Instances 
4. Security Groups
5. Application Load Balancer


Application Load balancer will have 2 private instances as targets.
## Terraform files Explained:

1. 01-vpc-module.tf
`This tf file is used for creating all VPC related resources. I am using VPC module (version-"3.19.0") in this file. You can check all inputs that i am providing in the file and i used varibales for most of the resources.This will create public and private subnets , NAT gateway for private instances which i am also going to create`

2. 02-vpc-variables.tf
`I am not hard coding the values for vpc resources so anyone can use this with their own requirements, In this file i am using variables for AZ's , CIDR block for VPC and subnets`

3. 03-vpc-outputs.tf
`This file contains all the outputs of VPC, that can be usefull for us for any task e.g Ids of public and private subnets, vpc-id , NAT gateway ip , availability zones and CIDR blocks`

4. 04-vpc.auto.tfvars
`Variables values used in this file will be automatically uploaded when we run the terraform plan/apply command , so we can change values for vpc resources as per our needs in this file`

5. 05-datasorce-for-ami.tf
`In this file we are using datasource to get the lated AMI id from AWS for our ec2 instances` 

6. 06-bastion-sg.tf
`This file is used to create a security group for public ssh access on port 22 for our bastion host  `

7. 07-bastion-host.tf
`This file is for public instance and it is a Aws Ec2 module in terraform that i am using to create ec2 instance and it is using variables for public subnet from vpc and bastion security group`

8. 08-private-ec2-sg.tf
`This file is creating a private security group for private instances and allowing traffic internal from vpc`  

9. 09-private-ec2.tf
`this is private instances file and i am deploying 2 private instances in private subnets and it is also Aws ec2 module terraform`

10. 10-ec2-variabes.tf
`variable used for ec2 instances like key_pair , instance-type and instance-count`    

11. 11-ec2-outputs.tf
`Outputs related to ec2 instances like public , private IPs etc.`

12. 12-remote-exec.tf
`This is null provider. By using null provider of terraform i am copying the pem key which will be used to connect to all instances to bastion host using local exec and also on same hand using remote exec i am applying required permissions to the key also`

13. 13-alb-sg.tf
`Security Group for application load balancer which is opened for all traffic on http port`

14. 14-alb.tf
`Application load balancer which have 2 private instances as targets`  

15. 15-alb-outputs.tf
`outputs for alb`

16. locals.tf
`In this file i am using local values to pass names and tags to resources`

17. variables.tf
`It contains generic variables `

18. private_key
`This directory has the terraform-key.pem key `

19. app-user-data.sh
`This is the user data script which i am loading to instances on creation time`

20. providers.tf
`This file is used for declaring the values for the providers like terraform version and provider Aws version and null version`











