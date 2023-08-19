resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"
    tags = {
    Name = "sreejith_vpc"
    }
}
  #enable_dns_support = yes
  #enable_dns_hostnames = yes

  resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-south-1a" 
  map_public_ip_on_launch = false

  tags = {
    Name = "rock_private_subnet"
  }
  }

  resource "aws_security_group" "private_sg" {
  vpc_id = aws_vpc.main.id

  // Define your security group rules for inbound/outbound traffic
  }

  resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.100.0/24"
  availability_zone = "ap-south-1b" 
  map_public_ip_on_launch = true

  tags = {
    Name = "rock_public_subnet"
  }
  }
 

  resource "aws_network_acl" "public_acl" {
  vpc_id = aws_vpc.main.id
  
  egress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "10.0.100.0/28"
    from_port  = 443
    to_port    = 443
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "10.0.100.0/28"
    from_port  = 80
    to_port    = 80
  }
  
  tags = {
    Name = "main"
  }
  }
  // Define your network ACL rules for inbound/outbound traffic
  



