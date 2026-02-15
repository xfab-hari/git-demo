variable "vpc_id" {
  description = "The ID of the VPC where security groups will be created"
  type        = string
}

variable "allowed_ssh_cidr" {
  description = "CIDR block allowed for SSH access"
  type        = string
  default     = "115.127.129.240/32"
} 