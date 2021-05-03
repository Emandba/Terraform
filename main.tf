terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "dbasso"
  region  = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami                    = "ami-830c94e3"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-0e2cd44345e6db04c"]
  subnet_id              = "subnet-0c5ef2f3bf2628b11"

  tags = {
    Name      = "ExampleAppServerInstance"
    dept      = "DWS"
    app       = "database"
    division  = "DTS"
    security  = 0
    elcid     = "WSITINFRA"
    contact = "eswain"
    env = "dev"
    supportcode = "nocharge"
  }
}

