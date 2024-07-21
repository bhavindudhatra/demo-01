terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "-->5.58.0"
        }
    }
    required version = ">=1.2.0"
}

provider "aws"{
    region = "us-east-1"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "terraform-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["eu-west-1a", "eu-west-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

resource "aws_instance" "Demo-server" {
    ami = "ami-0b72821e2f351e396"
    instance_type = "t2.micro"

    tags = {
        Name = "demo_aws"
    }
}