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
  access_key = "AKIAXTQSVVA4WK2KG7DZ"
  secret_key = "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"
  region  = "ap-southeast-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0d3734a9c753bb2a7"
  instance_type = "t2.micro"
  key_name      = "terraform-key"
  security_groups = ["${aws_security_group.allow_rdp.name}"]

  tags = {
    Name = "Atividade04_Victor_Terraform"
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
  }

}

