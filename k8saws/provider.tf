terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.59.0"
    }
  }
}


# Configuration options
provider "aws" {
  region = "us-west-2"
}