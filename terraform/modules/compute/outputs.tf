output "sandbox_vm01_id" {
  description = "The instance ID of sandbox VM 01"
  value       = aws_instance.sandbox_vm01.id
}

output "sandbox_vm01_public_ip" {
  description = "The public IP of sandbox VM 01"
  value       = aws_instance.sandbox_vm01.public_ip
}

output "sandbox_vm01_public_dns" {
  description = "The public DNS of sandbox VM 01"
  value       = aws_instance.sandbox_vm01.public_dns
}

output "sandbox_vm01_name" {
  description = "The name of sandbox VM 01"
  value       = aws_instance.sandbox_vm01.tags.Name
}

output "key_pair_name" {
  description = "Name of the created key pair"
  value       = aws_key_pair.terraform_keypair.key_name
} 