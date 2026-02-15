output "vm_public_ip" {
  value = aws_instance.insecure_vm.public_ip
}
