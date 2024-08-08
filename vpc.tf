variable "vpc_cidr_block" {
  type        = string
  description = "The CIDR block for the VPC"
}

data "aws_availability_zones" "available" {}

locals {
  availability_zones = data.aws_availability_zones.available.names
  az_count           = length(local.availability_zones)
}

resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true

  tags = {
    Name = "main-vpc"
  }
}

resource "aws_subnet" "private_subnet" {
  count = local.az_count

  vpc_id            = aws_vpc.main.id
  availability_zone = data.aws_availability_zones.available.names[count.index]
  cidr_block        = cidrsubnet(aws_vpc.main.cidr_block, 8, count.index + 1)

  tags = {
    Name = "PrivateSubnet-${count.index}"
  }
}
