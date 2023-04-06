
# 01-Terraform-AWS-VPC-EC2 Creation

In this small project , i am showing that how we can create a small VPC-EC2 architecture.
This project is managed by terraform and i'll show how we can create our infrastructure using terraform. AWS Cloud is used in this architecture and following resources will be created
1. VPC
2. Private and public subnets
3. Nat Gateway
4. Bastion Host (public ec2 used to jump to private ec2s) 
5. Private EC2 (2) 
6. Security Groups for both instances
7. Local exec and Remote Exec for terraform



## Documentation

[Terraform](https://registry.terraform.io/) | [AWS-DOCS](https://docs.aws.amazon.com/index.html)

This project is based on AWS and this will create a VPC with 2 public and private subnets. Also there are 2 security groups will get created along with 3 ec2 instances (one is public and two private instances). I am also using locals , provisioners in this project and i'll walk through all the terraform files now.
In the directory containing the all tf files , first run `terraform init` command to initialize terraform and then you can run `terraform validate` to check if all the tf files are valid and in the end you can `terraform plan and apply` command to create infrastructure
## Terraform files Exaplained:

1. 01-vpc-module.tf
`This tf file is used for creating all VPC related resources. I am using VPC module (version-"3.19.0") in this file. You can check all inputs that i am providing in the file and i used varibales for most of the resources.This will create public and private subnets , NAT gateway for private instances which i am also going to create`

2. 02-vpc-outputs.tf
`This file contains all the outputs of VPC, that can be usefull for us for any task e.g Ids of public and private subnets, vpc-id , NAT gateway ip , availability zones and CIDR blocks`

3. 03-vpc-variables.tf
`I am not hard coding the values for vpc resources so anyone can use this with their own requirements, In this file i am using variables for AZ's , CIDR block for VPC and subnets`

4. 04-vpc.auto.tfvars
`Variables values used in this file will be automatically uploaded when we run the terraform plan/apply command , so we can change values for vpc resources as per our needs in this file`

5. 05-bastion-host-SG.tf
`This file is used to create a security group for public ssh access on port 22 for our bastion host  `


6. 06-private-SG.tf
`This file is creating a private security group for private instances and allowing traffic internal from vpc`    
                         
7. 07-security-group-outputs.tf 
`This file has all the outputs relate to security groups`         

8. 08-data-source.tf
`In this file we are using datasource to get the lated AMI id from AWS for our ec2 instances`               
   
9. 09-ec2-variables.tf
`variable used for ec2 instances like key_pair , instance-type and instance-count`                          
  
10. 10-bastion-host.tf
`This file is for public instance and it is a Aws Ec2 module in terraform that i am using to create ec2 instance and it is using variables for public subnet from vpc and bastion security group` 

11. 11-private-ec2.tf
`this is private instances file and i am deploying 2 private instances in private subnets and it is also Aws ec2 module terraform`

12. 12-instances-outputs.tf
`Outputs related to ec2 instances like public , private IPs etc.` 

13. 13-null-provider-local-exec.tf
`This is null provider. By using null provider of terraform i am copying the pem key which will be used to connect to all instances to bastion host using local exec and also on same hand using remote exec i am applying required permissions to the key also`

14. ec2_instance.auto.tfvars
`All the variables values related to ec2 instances  `

15. local-values.tf
`In this file i am using local values to pass names and tags to resources`

16. generic-variables.tf
`It contains generic variables `

17. private_key
`This directory has the terraform-key.pem key `

18. app1-user-data.sh
`This is the user data script which i am loading to instances on creation time`

19. providers.tf
`This file is used for declaring the values for the providers like terraform version and provider Aws version and null version`
