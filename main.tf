variable "region" {
  type        = string
  description = "AWS region"
}

provider "aws" {
  region = var.region
}
