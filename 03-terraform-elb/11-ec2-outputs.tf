# bastion host important outputs 

output "bastion-host-id" {
  description = "The ID of the bastion instance"
  value       = module.ec2_instance.id
}


output "bastion-host_public_ip" {
  description = " Public IP of bastion instance "
  value       = module.ec2_instance.public_ip
}

# private instances important outputs

output "private-instances-ids" {
  description = "IDs of private instances "
  value       = [for instance in module.private_instance : instance.id]
  
}

output "private-instances-private-ip" {
  description = "Private IPs of private instacnes"
  value       = [for instance in module.private_instance : instance.private_ip]
}