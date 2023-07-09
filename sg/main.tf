provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "Amazonlinux" {
  ami = "ami-04a0ae173da5807d3"
  instance_type = "t2.micro"
  tags = {
    Name = "morhafTF"
  }
  security_groups = [aws_security_group.linuxsg.name]
}

resource "aws_security_group" "linuxsg" {
  name = "Allow Https"

  ingress {
    from_port = 443
    to_port = 443
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 443
    to_port = 443
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
}