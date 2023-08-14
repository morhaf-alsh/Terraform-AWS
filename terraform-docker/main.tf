provider "aws" {
  region = "us-east-1"
}


resource "aws_instance" "Amazonlinux" {
  ami = "ami-08a52ddb321b32a8c"
  instance_type = "t2.micro"
  tags = {
    Name = "Docker"
  }
  security_groups = [aws_security_group.dockersg.name]

  user_data = file("./docker.sh")
}






resource "aws_security_group" "dockersg"{
    name = "sg"

    dynamic "ingress"{ 
    iterator = port
    for_each = [22,443,80,8000]
    content {
      from_port = port.value
      to_port = port.value
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
}

    dynamic "egress"{ 
    iterator = port
    for_each = [22,443,80,8000]
    content {
      from_port = port.value
      to_port = port.value
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
}
}