# Terraform Settings Blocck
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
}

# Provider Block
provider "aws" {
  profile = "default" # AWS Credentials Profile configured on your local desktop terminal  $HOME/.aws/credentials
  region  = "ap-south-1"
}

# Resource Block
resource "aws_instance" "ec2_server" {
  ami           = "ami-0da59f1af71ea4ad2"
  instance_type = "t2.micro"
  subnet_id     = "subnet-0805e826a0a3c729b"  # Specify a valid subnet ID here
  key_name      = "sreejithb"

  tags = {
    Name = "SuperBulls"
  }
}