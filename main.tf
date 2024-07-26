terraform {
  backend "remote" {
    organization = "Redz-Innovations"
    workspaces {
      name = "Innovation1"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  profile = "default"
  region = "us-east-1"
}

resource "aws_instance" "my_server" {
  ami           = "ami-087c17d1fe0178315"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}