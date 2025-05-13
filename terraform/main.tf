terraform {
 required_providers {
   aws = {
     source = "hashicorp/aws"
   }
 }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami = "ami-052c08d706f3f0fbd"
  instance_type = "t2.micro"
}
 