
## Terraform AWS VPC Module creation Locally 

In this small project , i am showing that how we can create local module for AWS VPC. First i downloaded the zip file from Terrafrom Registry and in the root directory i created a folder name modules and extracted the contents of zip file. Then in root directory i created all tf files related to Aws Vpc and in source argument i referenced the root module folder. In this way we create a local module and change things accordingly 

1. VPC
2. Private and public subnets
3. Nat Gateway




## Documentation

[Terraform](https://registry.terraform.io/) | [AWS-DOCS](https://docs.aws.amazon.com/index.html)


## Terraform files Explained:

1. 01-vpc-module.tf
`This tf file is used for creating all VPC related resources. I am using VPC module (version-"3.19.0") in this file. You can check all inputs that i am providing in the file and i used varibales for most of the resources.This will create public and private subnets , NAT gateway for private instances which i am also going to create`

2. 02-vpc-outputs.tf
`This file contains all the outputs of VPC, that can be usefull for us for any task e.g Ids of public and private subnets, vpc-id , NAT gateway ip , availability zones and CIDR blocks`

3. 03-vpc-variables.tf
`I am not hard coding the values for vpc resources so anyone can use this with their own requirements, In this file i am using variables for AZ's , CIDR block for VPC and subnets`

4. 04-vpc.auto.tfvars
`Variables values used in this file will be automatically uploaded when we run the terraform plan/apply command , so we can change values for vpc resources as per our needs in this file`


5. local-values.tf
`In this file i am using local values to pass names and tags to resources`

6. generic-variables.tf
`It contains generic variables `


7. providers.tf
`This file is used for declaring the values for the providers like terraform version and provider Aws version and null version`
