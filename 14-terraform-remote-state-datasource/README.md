
# Terraform Remote State Datasource

In this demo we are going to use terraform remote state datasource. The purpose of using terraform remote state datasource is that we can use outputs form 1 project as inputs to another project. To understand it we are using 2 projects in this demo:

1. `AWS VPC` = We are creating aws vpc related all things usings terraform and storing the state file in s3 bucket `test-bucket-myapp` in folder `state-file/vpc-statefile/` and also using the state locking using dynamo-db.

2. Also in `AWS EC2` we are creating aws ec2 and to use the arguments related to vpc in this we are referencing the remote-state datasource in place of vpc related arguments. For this i have created a `terraform-remote-state-datasource.tf` file in which i have referencing the state file of `Aws Vpc` so that our ec2 can use the vpc related subnets from `aws vpc`. In this way we can use terraform remote state datasource to use outputs from one project to another..


## NOTE = Terraform remote state datasource works on the basis of outputs. So we have to make sure that in root module we have to declare the declaret he outputs which we need to use in child module. In other words i have declared exact outputs's names in aws vpc and using these outputs in aws ec2 for example below value of vpc security group id ,i using it in aws ec2 and also declared same output in aws vpc with name vpc-security_group_id:-
vpc_security_group_ids = [data.terraform_remote_state.vpc.outputs.vpc-security_group_id]


-------------------------------------------------------------------

[Terraform-Remote-State](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state#config)

-------------------------------------------------------------------

