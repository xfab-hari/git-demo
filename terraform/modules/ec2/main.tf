variable "vpc_id" {}
variable "subnet1_id" {}
variable "subnet2_id" {}
variable "nw_interface1" {}
variable "nw_interface2" {}
variable "iam_instance_profile" {}

resource "aws_instance" "WebServer1" {
  ami                  = "ami-06c68f701d8090592"
  instance_type        = "t2.micro"
  iam_instance_profile = var.iam_instance_profile

  network_interface {
    network_interface_id = var.nw_interface1
    device_index         = 0
  }

  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install nginx -y
              systemctl start nginx
              systemctl enable nginx
              echo "<h1>Welcome to WebServer1</h1>" > /var/www/html/index.html
              EOF

  tags = {
    Name = "WebServer1"
  }
}

resource "aws_instance" "WebServer2" {
  ami                  = "ami-06c68f701d8090592"
  instance_type        = "t2.micro"
  iam_instance_profile = var.iam_instance_profile

  network_interface {
    network_interface_id = var.nw_interface2
    device_index         = 0
  }

  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install nginx -y
              systemctl start nginx
              systemctl enable nginx
              echo "<h1>Welcome to WebServer2</h1>" > /var/www/html/index.html
              EOF

  tags = {
    Name = "WebServer2"
  }
}

output "webserver1_id" {
  value = aws_instance.WebServer1.id
}

output "webserver2_id" {
  value = aws_instance.WebServer2.id
}
