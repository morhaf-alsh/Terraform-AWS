provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "db" {
  ami = "ami-04a0ae173da5807d3"
  instance_type = "t2.micro"
  tags = {
    Name = "morhafdb"
  }
}

resource "aws_instance" "web" {
  ami = "ami-04a0ae173da5807d3"
  instance_type = "t2.micro"
  tags = {
    Name = "morhafweb"
  }
  depends_on = [ aws_instance.db ]
}

data "aws_instance" "dbsearch" {
  filter { 
    name = "tag:Name"
    values = ["morhafdb"]
}
}

data "aws_instance" "websearch" {
  filter { 
    name = "tag:Name"
    values = ["morhafweb"]
}
}

output "dbservices" {
  value = data.aws_instance.dbsearch.availability_zone
}

output "webIP" {
  value = data.aws_instance.websearch.private_ip
}