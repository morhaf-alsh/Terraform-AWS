provider "aws" {
  region = "us-east-1"
}
variable "number-of-instances" { 
  type = number
}

resource "aws_instance" "Amazonlinux" {
  ami = "ami-04a0ae173da5807d3"
  instance_type = "t2.micro"
  count = var.number-of-instances
}