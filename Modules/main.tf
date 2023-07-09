provider "aws" {
  region = "us-east-1"
}

module "ec2module"{
    source = "./EC2"
    ec2_name = "webserver"
}

output "moduleout"{
    value = module.ec2module.instance_id
}