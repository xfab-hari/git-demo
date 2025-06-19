terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.0.0"
}

provider "aws" {
  region = var.region
}

# Network Module
module "network" {
  source = "./modules/network"

  vpc_name             = var.vpc_name
  vpc_cidr             = var.vpc_cidr
  public_subnet_name   = var.public_subnet_name
  public_subnet_cidr   = var.public_subnet_cidr
  availability_zone    = var.availability_zone
}

# Security Module
module "security" {
  source = "./modules/security"

  vpc_id = module.network.vpc_id
}

# Compute Module
module "compute" {
  source = "./modules/compute"

  instance_type        = var.sandbox_vm_instance_type
  key_pair_name        = var.key_pair_name
  ssh_public_key_path  = var.ssh_public_key_path
  security_group_id    = module.security.public_security_group_id
  subnet_id            = module.network.public_subnet_id
  availability_zone    = var.availability_zone
}
