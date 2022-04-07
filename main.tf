terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# PinhasZiv-vpc #
resource "aws_vpc" "PinhasZiv" {
  cidr_block = "10.0.0.0/25"
}

# Web Subnet #
resource "aws_subnet" "Web-Tier-Subnet" {
  vpc_id     = aws_vpc.PinhasZiv.id
  cidr_block = "10.0.0.0/27"

  tags = {
    Name = "web-subnet"
  }
}

# App Subnet #
resource "aws_subnet" "App-Tier-Subnet" {
  vpc_id     = aws_vpc.PinhasZiv.id
  cidr_block = "10.0.0.32/27"

  tags = {
    Name = "app-subnet"
  }
}

# DB Subnet #
resource "aws_subnet" "DB-Tier-Subnet" {
  vpc_id     = aws_vpc.PinhasZiv.id
  cidr_block = "10.0.0.64/28"

  tags = {
    Name = "db-subnet"
  }
}
