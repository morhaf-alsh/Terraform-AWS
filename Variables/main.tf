provider "aws" {
    region = "us-east-1"
}

variable "npcname" {
  type = string
  default = "morhaf"
}

variable "sshport" {
  type = number
  default = 22
}

variable "enabled" {
  default = true
}

variable "mylist" {
  type = list(string)
  default = ["value1","value2"]
}

variable "mymap" {
  type = map
  default = {
    key1 = "value1",
    key2 = "value2"
  }
}

variable "inputname" {
  type = string
  description = "set name"
}

resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = var.inputname
}
}

output "vpc-id" {
  value = aws_vpc.myvpc.id
} 

variable "mytuple" {
  type = tuple([string, number, string])
  default = ["morhaf", 1, "alshoufi"]
}
 variable "myobject" {
    type = object({name = string, port = number})
    default = {
        name = "morhaf"
        port = 1
    }
 }

 