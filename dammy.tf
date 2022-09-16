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
