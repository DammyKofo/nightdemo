provider "aws" {
  region = "us-east-1"
 profile = "default"
}


resource "aws_vpc" "ife-vpc" {
  cidr_block = "10.0.0.0/16"
   tags = {
     Name = "ife-vpc"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Main"
  }
}