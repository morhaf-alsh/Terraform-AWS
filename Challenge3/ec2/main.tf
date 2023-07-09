variable "tags"{
    type = map
}
variable "instance_type" {
    type = string
}

variable "ami"{
    type = string
}
variable "sg"{
    type = list(string)
    default = [ "default" ]
}

variable "user_data"{
    type = string
    default = null
}

variable "name" {
  type = string
  default = null
}

resource "aws_instance" "node" {
    ami = var.ami
    instance_type = var.instance_type
    security_groups = var.sg
    user_data = var.user_data
    tags = var.tags
}

output "private_ip" {
  value = aws_instance.node.private_ip
}
output "id" {
  value = aws_instance.node.id
}
output "tags" {
  value = aws_instance.node.tags
}