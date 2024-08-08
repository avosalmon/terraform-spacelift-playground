variable "environment" {
  type        = string
  description = "App environment"
}

variable "region" {
  type        = string
  description = "AWS region"
}

variable "vpc_cidr_block" {
  type        = string
  description = "The CIDR block for the VPC"
}
