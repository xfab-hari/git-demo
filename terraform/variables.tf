variable "region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "us-west-2"
}

variable "availability_zone" {
  description = "The AWS availability zone to deploy resources"
  type        = string
  default     = "us-west-2a"
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "custom-vpc"
}

variable "vpc_cidr" {
  description = "CIDR range for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_name" {
  description = "Name of the public subnet"
  type        = string
  default     = "subnet-public"
}

variable "public_subnet_cidr" {
  description = "CIDR range for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "sandbox_vm_instance_type" {
  description = "Instance type for sandbox VM 01"
  type        = string
  default     = "t3.small"
}

variable "ssh_username" {
  description = "Username for SSH access to the instances"
  type        = string
  default     = "ec2-user"
}

variable "ssh_public_key_path" {
  description = "Path to the SSH public key file"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "ssh_private_key_path" {
  description = "Path to the SSH private key file"
  type        = string
  default     = "~/.ssh/id_rsa"
}

variable "key_pair_name" {
  description = "Name of the AWS key pair to use for instances"
  type        = string
  default     = "tf-keypair"
}
