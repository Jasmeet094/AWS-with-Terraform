
## AWS Network Load Balancer

This Demo will create a simple network load balancer which will have 2 private ec2 instances as targets. Registering a dns name `nlb.jasmeetdevops.com` in Route53 and simple application can be accessible on both SSL (port 80) and TLS (Port 443).  Opened the ports 80,443 for all world so that traffic from NLB goes to private ec2s.








## Documentation

[Terraform](https://registry.terraform.io/modules/terraform-aws-modules/alb/aws/6.4.0) | [AWS-Docs](https://docs.aws.amazon.com/elasticloadbalancing/latest/network/introduction.html)

In this hands-on , we are going to create following aws resources :

1. AWS VPC with 2 public & private subnets
2. Nat Gateway
3. Instances 
4. Security Groups
5. Network Load Balancer
6. ACM (aws certificate manager)
7. DNS Registration in route53
8. Autoscaling Groups
9. Launch Templates 
10. SNS Topic


Network Load balancer will have 2 private instances as targets.
## Terraform files Explanation: 

                      ##PLEASE NOTE##
I already have a Domain name registered in route53 which is jasmeetdevops.com and i also have a 1 hosted zone created in route53 which i am using in this demo.

1. vpc.tf :-`This tf file is used for creating all VPC related resources. I am using VPC module (version-"3.19.0") in this file. You can check all inputs that i am providing in the file and i used varibales for most of the resources.This will create public and private subnets , NAT gateway for private instances which i am also going to create`

2. vpc-variables.tf :- `I am not hard coding the values for vpc resources so anyone can use this with their own requirements, In this file i am using variables for AZ's , CIDR block for VPC and subnets`

3. vpc.auto.tfvars:- `Variables values used in this file will be automatically uploaded when we run the terraform plan/apply command , so we can change values for vpc resources as per our needs in this file`

4. vpc-outputs.tf:- `This file contains all the outputs of VPC, that can be usefull for us for any task e.g Ids of public and private subnets, vpc-id , NAT gateway ip , availability zones and CIDR blocks`

5. SG-bastionhost.tf:- `This file is used to create a security group for public ssh access on port 22 for our bastion host`

6. bastion-host.tf:- `This file is for public instance and it is a Aws Ec2 module in terraform that i am using to create a ec2 instance`

7. data-source-ami.tf:- `In this file we are using datasource to get the latest AMI id from AWS for our ec2 instances`

8. data-source-route53.tf:- `As i already have a hosted zone in route53 , so i am using this data source to get the id of the hosted zone and also output the name and id of the hosted zone `

9. ec2-variables.tf:- `variable used for ec2 instances like key_pair , instance-type and instance-name for private instances`

10. ec2-auto.tfvars:- `auto ingested variables used for ec2 instance`

11. ec2-outputs.tf:- `Outputs related to ec2 instances like public , private IPs etc.`

12. route53-dns-register:- `This file is used to create A record in our hosted zone and name is apps.jasmeetdevops.com and also will create a alias for this record with our alb dns name`

13. route53-acm-register.tf:- `This file is used to create a ssl certificate for our dns name and also it will verify/validate the ssl certifciate`

14. SG-private-ec2.tf:- `This file is creating a private security group for private instances and allowing traffic from open world on port 80 and 443`

15. providers.tf:- `required providers used here like aws & local and random_pet resource`

16. NLB.tf:- `Create a NLB a simple target groups , not adding any targets in it as targets will be added by asg `

17. NLB-outputs.tf:- `Outputs related to alb`

18. SG-outputs.tf:- `outputs related to security groups`

19. ASG-resource.tf:- `Auto scaling resource creation file`

20. ASG-launch-template.tf:- `Launch template resource creation file`

21. ASG-outputs.tf:- `outputs related to auto scaling group`

22. ASG-notifications.tf:- `Creation of a SNS topic with a unique name used random pet resource for name in this file and creation of subscription as well and also creation of auto scaling related notifications`

23. ASG-ttsp.tf:- `Creation of target tracking scaling policy with types = cpu scaling policy `

24. app1-user-data.sh:- `user data script for parivate instances`

25. remote-exec.tf:- `This is null provider. By using null provider of terraform i am copying the pem key which will be used to connect to all instances to bastion host using local exec and also on same hand using remote exec i am applying required permissions to the key also`

26. locals.tf:- `Mostly tags are used as locals`

27. private_key:- `pem key for insatnces`





