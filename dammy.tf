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
  cidr_block = "10.0.0.1/24"

  tags = {
    Name = "Main"
  }
}
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.ife-vpc.id

  tags = {
    Name = "ife-igw"
  }
}

resource "aws_route_table" "ife-route-table" {
  vpc_id = aws_vpc.ife-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

route {
    ipv6_cidr_block        = "::/0"
    gateway_id             = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "ife-rt"
  }
}