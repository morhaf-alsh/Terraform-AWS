provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "Amazonlinux" {
  ami = "ami-04a0ae173da5807d3"
  instance_type = "t2.micro"
  tags = {
    Name = "morhafTF"
  }
}

resource "aws_eip" "LinuxIP" {
  instance = aws_instance.Amazonlinux.id
}

output "EIP" {
  value = aws_eip.LinuxIP.public_ip
}