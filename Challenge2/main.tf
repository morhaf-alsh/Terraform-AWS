provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "DBserver" {
    ami = "ami-04a0ae173da5807d3"
    instance_type = "t2.micro"
}

resource "aws_instance" "webserver" {
    ami = "ami-04a0ae173da5807d3"
    instance_type = "t2.micro"

    security_groups = [aws_security_group.websg.name]

    user_data = "${file("server-script.sh")}"
}

variable "ports" {
  type = list(number)
  default = [80,443]
}

resource "aws_security_group" "websg"{
    name = "sg"

    dynamic "ingress"{ 
    iterator = port
    for_each = var.ports
    content {
      from_port = port.value
      to_port = port.value
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
}

    dynamic "egress"{ 
    iterator = port
    for_each = var.ports
    content {
      from_port = port.value
      to_port = port.value
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
}

}

resource "aws_eip" "web_IP" {
  instance = aws_instance.webserver.id
}

output "DB_IP" {
  value = aws_instance.DBserver.private_ip
}

output "Web_IP" {
  value = aws_eip.web_IP.public_ip
}