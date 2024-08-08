terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # spacelift only supports up to Terraform 1.5.7
  required_version = ">= 1.5.7"
}
