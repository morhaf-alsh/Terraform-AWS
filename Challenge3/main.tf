provider "aws" {
  region = "us-east-1"
}

module "db_server"{
    source = "./ec2"
    instance_type = "t2.micro"
    ami = "ami-04a0ae173da5807d3"
    tags = {
        Name = "db"
    }
}

module "web_server"{
    source = "./ec2"
    instance_type = "t2.micro"
    ami = "ami-04a0ae173da5807d3"
    tags = {
        Name = "web"
    }
    sg = [module.websg.name]

    user_data = "${file("server-script.sh")}"
}

module "websg" {
  source = "./sg"
  name = "Websg"
  ports = [80,443,22]
  protocol = "TCP"
  cidr_blocks = ["0.0.0.0/0"]
}

module "EIP" {
  source = "./eip"
  instance = module.web_server.id
}

output "db_ip" {
  value = module.db_server.private_ip
}
output "EIP" {
  value = module.EIP.public_ip
}

output "webname" {
  value = module.web_server.tags.Name
}

output "dbname" {
  value = module.db_server.tags.Name
}