# AWS EC2 Instance Terraform Outputs
# Public EC2 Instances - Bastion Host

output "bastion_host_id" {
  description = "Instance Id"
  value       = module.ec2-bastion-host.id
}

## ec2_bastion_public_ip
output "ec2_bastion_public_ip" {
  description = "public IP address"
  value       = module.ec2-bastion-host.public_ip 
}

# Private EC2 Instances
## ec2_private_instance_ids
output "ec2_private_instance_ids" {
  description = "List of IDs of instances"
  value       = "${join(",", module.private_instance.*.id)}"
}
## ec2_private_ip
output "ec2_private_ip" {
  description = "List of private IP addresses assigned to the instances"
  value       = "${join(",", module.private_instance.*.private_ip)}"
}




