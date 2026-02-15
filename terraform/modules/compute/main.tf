# Data source to get the latest Amazon Linux 2 AMI
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# Key Pair for EC2 instances
resource "aws_key_pair" "terraform_keypair" {
  key_name   = var.key_pair_name
  public_key = file(var.ssh_public_key_path)

  tags = {
    Name = var.key_pair_name
  }
}

# Sandbox VM 01
resource "aws_instance" "sandbox_vm01" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.terraform_keypair.key_name
  vpc_security_group_ids = [var.security_group_id]
  subnet_id              = var.subnet_id
  availability_zone      = var.availability_zone

  root_block_device {
    volume_type = "gp3"
    volume_size = 20
    encrypted   = true
  }

  tags = {
    Name = "sandbox-vm01"
    Type = "Public"
  }
} 