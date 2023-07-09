provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "Amazonlinux" {
  ami = "ami-04a0ae173da5807d3"
  instance_type = "t2.micro"
  count = 3
}