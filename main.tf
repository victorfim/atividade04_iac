terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  access_key = ""
  secret_key = ""
  region  = "ap-southeast-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0d3734a9c753bb2a7"
  instance_type = "t2.micro"
  key_name      = "terraform-key"
  security_groups = ["${aws_security_group.allow_rdp.name}"]

  tags = {
    Name = "Victor_Atividade04_Terraform"
  }
}

resource "aws_security_group" "allow_rdp" {
  name = "allow_rdp"
  description = "Allow ssh"

  ingress {
    from_port = 3389
    to_port   = 3389
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port = 5986
    to_port   = 5986
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = -1

    cidr_blocks = ["0.0.0.0/0"]
  }

}
