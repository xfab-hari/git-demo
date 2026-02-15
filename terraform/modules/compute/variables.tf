variable "instance_type" {
  description = "Instance type for the EC2 instances"
  type        = string
}

variable "key_pair_name" {
  description = "Name of the AWS key pair to use for instances"
  type        = string
}

variable "ssh_public_key_path" {
  description = "Path to the SSH public key file"
  type        = string
}

variable "security_group_id" {
  description = "ID of the security group to assign to instances"
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet where instances will be created"
  type        = string
}

variable "availability_zone" {
  description = "The AWS availability zone to deploy resources"
  type        = string
} 