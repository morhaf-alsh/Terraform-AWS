provider "aws" {
  region = "us-east-1"
}

variable "names" {
  type=list
  default = ["wb01", "db01"]
}
resource "aws_instance" "servers" {
  ami = "ami-0a0c8eebcdd6dcbd0"
  instance_type = "t4g.small"
  count=length(var.names)
      tags = {
      Name = var.names[count.index]
    }

}
resource "aws_instance" "Controller" {
  ami = "ami-0a0c8eebcdd6dcbd0"
  instance_type = "t4g.small"
  count=length(var.names)
      tags = {
      Name = "Controller"
    }
    user_data = file("./ansible.sh")

}