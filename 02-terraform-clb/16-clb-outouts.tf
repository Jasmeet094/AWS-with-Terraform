output "elb_id" {
  description = "The name of the ELB"
  value       = module.clb_test.elb_id
}

output "elb_name" {
  description = "The name of the ELB"
  value       = module.clb_test.elb_name
}

output "elb_dns_name" {
  description = "The DNS name of the ELB"
  value       = module.clb_test.elb_dns_name
}

output "elb_instances" {
  description = "The list of instances in the ELB (if may be outdated, because instances are attached using elb_attachment resource)"
  value       = module.private_instance
}