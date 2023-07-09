variable "instance" {
  type = string
}

resource "aws_eip" "EIP" {
  instance = var.instance
}

output "public_ip" {
  value = aws_eip.EIP.public_ip
}