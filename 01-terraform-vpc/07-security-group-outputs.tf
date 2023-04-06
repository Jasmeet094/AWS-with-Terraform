# outputs for bastion host SG
output "bastion_host_sg_id" {
  description = "The ID of the security group"
  value       = module.bastion-security-group.security_group_id
}

output "bastion_host_vpc_id" {
  description = "The VPC ID"
  value       = module.bastion-security-group.security_group_vpc_id
}
output "bastion_sg_name" {
  description = "The name of the security group"
  value       = module.bastion-security-group.security_group_name 
}

# outputs for SG private
output "private_sg_id" {
  description = "The ID of the security group"
  value       = module.private-security-group.security_group_id
}

output "pricate_sg_vpc_id" {
  description = "The VPC ID"
  value       = module.private-security-group.security_group_vpc_id
}
output "private_sg_name" {
  description = "The name of the security group"
  value       = module.private-security-group.security_group_name
}