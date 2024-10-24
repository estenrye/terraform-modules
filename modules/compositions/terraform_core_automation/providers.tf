terraform {
  required_version = ">= 1.1"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.73.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
  # profile = "ryezone-labs"
}