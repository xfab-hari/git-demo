output "public_security_group_id" {
  description = "The ID of the public security group"
  value       = aws_security_group.public_sg.id
}

output "public_security_group_name" {
  description = "The name of the public security group"
  value       = aws_security_group.public_sg.name
} 