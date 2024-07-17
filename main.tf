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

resource "aws_instance" "app_server" {
    ami = "ami-00beae93a2d981137"
    instance_type = "t2.micro"

    tags = {
        Name = "demo_aws"
    }
}