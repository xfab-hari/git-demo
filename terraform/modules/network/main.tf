resource "aws_vpc" "AppVPC" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "AppVPC"
  }
}

resource "aws_internet_gateway" "AppIGW" {
  vpc_id = aws_vpc.AppVPC.id

  tags = {
    Name = "AppInternetGateway"
  }
}

resource "aws_route_table" "AppRouteTable" {
  vpc_id = aws_vpc.AppVPC.id

  tags = {
    Name = "AppRouteTable"
  }
}

resource "aws_route" "internet_access" {
  route_table_id         = aws_route_table.AppRouteTable.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.AppIGW.id
}

resource "aws_subnet" "AppSubnet1" {
  vpc_id                  = aws_vpc.AppVPC.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "AppSubnet1"
  }
}

resource "aws_route_table_association" "AppSubnet1_association" {
  subnet_id      = aws_subnet.AppSubnet1.id
  route_table_id = aws_route_table.AppRouteTable.id
}

resource "aws_subnet" "AppSubnet2" {
  vpc_id                  = aws_vpc.AppVPC.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "AppSubnet2"
  }
}

resource "aws_route_table_association" "AppSubnet2_association" {
  subnet_id      = aws_subnet.AppSubnet2.id
  route_table_id = aws_route_table.AppRouteTable.id
}

resource "aws_security_group" "WebTrafficSG" {
  vpc_id = aws_vpc.AppVPC.id
  name   = "WebTrafficSG"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "WebTrafficSG"
  }
}

resource "aws_network_interface" "nw-interface1" {
  subnet_id       = aws_subnet.AppSubnet1.id
  security_groups = [aws_security_group.WebTrafficSG.id]

  tags = {
    Name = "nw-interface1"
  }
}

resource "aws_network_interface" "nw-interface2" {
  subnet_id       = aws_subnet.AppSubnet2.id
  security_groups = [aws_security_group.WebTrafficSG.id]

  tags = {
    Name = "nw-interface2"
  }
}

output "vpc_id" {
  value = aws_vpc.AppVPC.id
}

output "subnet1_id" {
  value = aws_subnet.AppSubnet1.id
}

output "subnet2_id" {
  value = aws_subnet.AppSubnet2.id
}

output "subnet_ids" {
  value = [aws_subnet.AppSubnet1.id, aws_subnet.AppSubnet2.id]
}

output "nw_interface1" {
  value = aws_network_interface.nw-interface1.id
}

output "nw_interface2" {
  value = aws_network_interface.nw-interface2.id
}
