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
  key_name = aws_key_pair.key.key_name
}


resource "aws_key_pair" "key" {
  key_name = "ansible"
  public_key = ""


}

output "ips" {
    value = aws_instance.servers.*.public_ip
}


# resource "aws_instance" "Controller" {
#   ami = "ami-0a0c8eebcdd6dcbd0"
#   instance_type = "t4g.small"
#       tags = {
#       Name = "Controller"
#     }
#     user_data = file("./ansible.sh")

# }
