output "sandbox_vm01_name" {
  description = "The name of sandbox VM 01"
  value       = module.compute.sandbox_vm01_name
}

output "sandbox_vm01_instance_id" {
  description = "The instance ID of sandbox VM 01"
  value       = module.compute.sandbox_vm01_id
}

output "sandbox_vm01_public_ip" {
  description = "The public IP of sandbox VM 01"
  value       = module.compute.sandbox_vm01_public_ip
}

output "sandbox_vm01_public_dns" {
  description = "The public DNS of sandbox VM 01"
  value       = module.compute.sandbox_vm01_public_dns
}

output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.network.vpc_id
}

output "public_subnet_id" {
  description = "The ID of the public subnet"
  value       = module.network.public_subnet_id
}

output "default_network_acl_id" {
  description = "The ID of the default network ACL"
  value       = module.network.default_network_acl_id
}
