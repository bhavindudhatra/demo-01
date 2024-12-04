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

resource "aws_instance" "Demo-server" {
    ami = "ami-0b72821e2f351e396"
    instance_type = "t2.micro"

    tags = {
        Name = "demo_aws"
    }
}

##for testing purpose 