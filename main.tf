terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.42.0"
    }
  }
}

provider "aws" {
  region = "us-west-1"
}

resource "aws_instance" "terraform" {
  ami           = "ami-0b990d3cfca306617"
  instance_type = "t2.micro"
  key_name      = "terraform-key"
  user_data     = "${file("install_jenkins.sh")}"


  tags = {
    Name = "terraform-user"
  }
}

resource "aws_default_security_group" "default" {
  vpc_id = "vpc-02ec900af56b4e0a7"


  ingress {
    description = "Allow SSH Traffic"
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allow 8080 Traffic"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
