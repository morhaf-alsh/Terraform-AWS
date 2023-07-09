provider "aws" {
  region = "us-east-1"
}


variable "ingressrules" {
  type = list(number)
  default = [80,443]
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

  dynamic "ingress" {
    iterator = port
    for_each = var.ingressrules

    content {
      from_port = port.value
      to_port = port.value
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
   
  }
  
  dynamic "egress" {
    iterator = port
    for_each = var.ingressrules

    content {
      from_port = port.value
      to_port = port.value
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
   
  }
}