variable "ports" {
  type = list(number)
}

variable "name" {
  type = string
}

variable "protocol"{
    type = string
}

variable "cidr_blocks"{
    type = list(string)
}

resource "aws_security_group" "sg"{
    name = var.name
   
    dynamic "ingress"{ 
    iterator = port
    for_each = var.ports
    content {
      from_port = port.value
      to_port = port.value
      protocol = var.protocol
      cidr_blocks = var.cidr_blocks
    }
}

    dynamic "egress"{ 
    iterator = port
    for_each = var.ports
    content {
      from_port = port.value
      to_port = port.value
      protocol = var.protocol
      cidr_blocks = var.cidr_blocks
    }
}

}

output "name" {
  value = aws_security_group.sg.name
}