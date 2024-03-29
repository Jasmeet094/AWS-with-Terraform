#####################################################
PLEASE NOTE - CURRENTLY THERE IS A BUG IN THIS TERRAFORM PROJECT, SO IF YOU WANT TO TEST THIS PROJECT FIRST PLEASE COMMENT ALL THE RDS RELATED TF FILES FOR EXAMPLE RDS, RDS-SG, RDS-VARIABLES AND ALSO COMMENT OUT THE USER-DATA LINE FROM PRIVATE-APP 3 INSTANCE. THEN APPLY THE TERRAFORM COMMAND AND CREATE RDS MANUALLY IN THE SAME VPC WHICH IS CREATED FROM TERRAFORM.

####################################################


## AWS 3 tier Web Application using Application Load Balancer, Route53 and RDS (mysql)

This is a 3 tier `springboot java application` deployed on AWS. SO in this demo we are deploying aws resources like vpc , rds ,alb , route53 , cartificates and registering domain for our application. On instances private-app1 and private-app2 we are deploying a simple html page app which can be accessible on this URL - `dev.jasmeetdevops.com/app1/` and app2 will be accessible on `dev.jasmeetdevops.com/app2/`.

`jasmeetdevops.com` is hosted zone which i already have. and using terraform file `dns-register.tf` i am registering a new record in my hosted zone with name dev.jasmeetdevops.com. 

file `app3-uma-install.tftpl` has commands in it which will install required tools and download the application's source code from github and also we are exporting RDS related information while installing/deploying the source code so it can use our RDS database and we using it as user-data script for privateapp3 instance using `Templatefile`. AN our springboot application will be accesible on `dev.jasmeetdevops.com` after successfull deployment.

While deploying RDS we dont hardcoded the DB password in auto.tfvars file instead we are using `secrets.tfvars` for password and we have to use this file while executing terraform commands

1.terraform plan -var-file="secrets.tfvars" -auto-approve
2.terraform apply -var-file="secrets.tfvars" -auto-approve
3.terraform destroy -var-file="secrets.tfvars" -auto-approve





## Documentation

[Terraform](https://registry.terraform.io/modules/terraform-aws-modules/alb/aws/6.4.0) | [AWS-Docs](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/introduction.html)

In this hands-on , we are going to create following aws resources :

1. AWS VPC with 2 public & private subnets
2. Nat Gateway
3. Instances 
4. Security Groups
5. Application Load Balancer
6. ACM (aws certificate manager)
7. DNS Registration in route53


Application Load balancer will have 4 private instances as targets.
## Terraform files Explanation: 

                      ##PLEASE NOTE##
I already have a Domain name registered in route53 which is jasmeetdevops.com and i also have a 1 hosted zone created in route53 which i am using in this demo.

1. vpc.tf :-`This tf file is used for creating all VPC related resources. I am using VPC module (version-"3.19.0") in this file. You can check all inputs that i am providing in the file and i used varibales for most of the resources.This will create public and private subnets , NAT gateway for private instances which i am also going to create`

2. vpc-variables.tf :- `I am not hard coding the values for vpc resources so anyone can use this with their own requirements, In this file i am using variables for AZ's , CIDR block for VPC and subnets`

3. vpc.auto.tfvars:- `Variables values used in this file will be automatically uploaded when we run the terraform plan/apply command , so we can change values for vpc resources as per our needs in this file`

4. vpc-outputs.tf:- `This file contains all the outputs of VPC, that can be usefull for us for any task e.g Ids of public and private subnets, vpc-id , NAT gateway ip , availability zones and CIDR blocks`

5. bastion-host-sg.tf:- `This file is used to create a security group for public ssh access on port 22 for our bastion host`

6. bastion-host.tf:- `This file is for public instance and it is a Aws Ec2 module in terraform that i am using to create a ec2 instance`

7. data-source-ami.tf:- `In this file we are using datasource to get the latest AMI id from AWS for our ec2 instances`

8. data-source-route53.tf:- `As i already have a hosted zone in route53 , so i am using this data source to get the id of the hosted zone and also output the name and id of the hosted zone `

9. instances-var.tf:- `variable used for ec2 instances like key_pair , instance-type and instance-name for private instances`

10. private-ec2-app1.tf:- `This is private instances file and i am deploying 2 private instances in private subnets for app1. So these 2 instances will handle the traffic for apps.jasmeetdevops.com/app1`

11. private-ec2-app2.tf:- `This is private instances file and i am deploying 2 private instances in private subnets for app1. So these 2 instances will handle the traffic for apps.jasmeetdevops.com/app2`

12. private-SG.tf:- `This file is creating a private security group for private instances and allowing traffic internally within/from vpc on port 80 and 22`

13. instances-outputs.tf:- `Outputs related to ec2 instances like public , private IPs etc.`

14. remote-exec.tf:- `This is null provider. By using null provider of terraform i am copying the pem key which will be used to connect to all instances to bastion host using local exec and also on same hand using remote exec i am applying required permissions to the key also`

15. user-data-app1.sh:- `user data script for app1 instances `

16. user-data-app2.sh:- `user data script for app2 instances`

17. acm-certificate-validation.tf:- `This file is used to create a ssl certificate for our dns name and also it will verify/validate the ssl certifciate`

18. alb-sg.tf:- `Security Group for application load balancer which is opened for all traffic on http and https port from world`

19. ALB.tf:- `Create a ALB and 2 target groups. 2 instances for app1 will register in app1 target group and 2 instances for app2 will register in app1 target group. Also there will be 2 listners will create and also adding certificate with https listners`

20. alb-outputs.tf:- `Outputs related to alb`

21. dns-register.tf:- `This file is used to create A record in our hosted zone and name is apps.jasmeetdevops.com and also will create a alias for this record with our alb dns name`

22. private-ec2-app3.tf:- `This instance is used to host the usermanagement application.`

23. user-data-bastion.sh:- `Commands in this script will be executed on bastion host , we are installing mysql client to check the network connectivity for RDS`

24. locals.tf:- `Mostly tags are used as locals`

25. private_key:- `pem key for insatnces`

26. providers.tf:- `required providers used here like aws & local`

27. variables.tf:- `common variables used in this file`

28. Rds-sg.tf:- `Security group for RDS usualy allowing traffic internally on port 3306`

29. Rds.tf:- `RDS mysql database`

30. Rds-outputs.tf:- `RDS related outputs`

31. Rds-variables.tf:- `variables defined for RDS`

31. -Rds.auto.tfvars:- `variables values can be changed as per needs`

32. secret.tfvars:- `RDS db passowrd value to used while executing terraform apply command`

33. app3-uma-install.tftpl:- `User data script for private ec2-3 in which we are hosting user-mangement-application`