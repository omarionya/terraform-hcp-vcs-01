
terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  cloud {
    organization = "patonya"

    workspaces {
      name = "terraform-hcp-vcs-01"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "demo" {
  bucket_prefix = "hcp-terraform-demo-"

  tags = {
    Name        = "hcp-terraform-demo-01"
    Environment = "dev"
  }
}