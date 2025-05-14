provider "aws" {
  region = "us-east-1"
}

module "network" {
  source              = "./modules/network"
  vpc_name            = "TestVPC"
  vpc_cidr            = "10.0.0.0/16"
  public_subnet_cidr  = "10.0.1.0/24"
  availability_zone   = "us-east-1a"
}

# Open Security Group
resource "aws_security_group" "open_sg" {
  name   = "open_sg"
  vpc_id = module.network.vpc_id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "OpenSG"
  }
}

resource "aws_instance" "insecure_vm" {
  ami                         = "ami-06c68f701d8090592"
  instance_type               = "t2.micro"
  subnet_id                   = module.network.public_subnet_id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.open_sg.id]

  tags = {
    Name = "ExposedVM"
  }
}
