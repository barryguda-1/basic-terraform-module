variable "main_region" {
  type    = string
  default = "us-east-1"
}

provider "aws" {
  region = var.main_region
}

module "vpc" {
  source = "./modules/vpc" #Invoking vpc module using relative path
  region = var.main_region
}

resource "aws_instance" "my-instance" {
  ami           = module.vpc.ami_id #Gets the value from outputs tf file
  subnet_id     = module.vpc.subnet_id
  instance_type = "t2.micro"
}
