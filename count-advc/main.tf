provider "aws" {
  region = "us-east-1"
}

module "db" {
  source = "./db"
  server_names = ["Mariadb", "postgresql", "mongodb"]
}

output "private_ips" {
  value = module.db.private_ip
}