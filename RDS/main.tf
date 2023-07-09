provider "aws" {
  region = "us-east-1"
}

resource "aws_db_instance" "Mydb" {
  db_name = "Mydbs"
  identifier = "firstdb"
  instance_class = "db.t2.micro"
  engine = "mariadb"
  engine_version = "10.4.25"
  username = "morhaf"
  password = "password"
  port = 3306
  allocated_storage = 20
  skip_final_snapshot = true
}