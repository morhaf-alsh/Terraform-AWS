variable "ec2_name"{
    type = string
}

resource "aws_instance" "Amazonlinux" {
  ami = "ami-04a0ae173da5807d3"
  instance_type = "t2.micro"
  tags = {
    Name = var.ec2_name
  }
}

output "instance_id"{
    value = aws_instance.Amazonlinux.id
}