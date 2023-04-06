# AWS EC2 Instances Teraform Outputs

# Public EC2 Instances - Bastion Host

## ec2_bastion_public_instance_ids
output "ec2_bastion_public_instance_ids" {
  description = "List of IDs of instances"
  value       = module.ec2_instance.id
}

## ec2_bastion_public_ip
output "ec2_bastion_public_ip" {
  description = "List of public IP addresses assigned to the instances"
  value       = module.ec2_instance.public_ip
}

# App1 - Private EC2 Instances Ids
output "app1_ec2_private_instance_ids" {
  description = "List of IDs of instances"
  value       = [for instance in module.private_app1 : instance.id]
}
## App1 - ec2_private_ip
output "app1_ec2_private_ip" {
  description = "List of private IP addresses assigned to the instances"
  value       = [for instance in module.private_app1 : instance.private_ip]
}

# App2 - Private EC2 Instances Ids

output "app2_ec2_private_instance_ids" {
  description = "List of IDs of instances"
  value       = [for instance in module.private_app2 : instance.id]
}
## App2 - ec2_private_ip
output "app2_ec2_private_ip" {
  description = "List of private IP addresses assigned to the instances"
  value       = [for instance in module.private_app2 : instance.private_ip]
}

