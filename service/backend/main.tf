terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.63.0"
    }
  }

  required_version = ">= 1.0.0"

  backend "s3" {
    bucket         = "comroom-terraform-state"
    key            = "prod/services/backend/terraform.tfstate"
    region         = "ap-northeast-2"
    dynamodb_table = "comroom-terraform-state-locks"
    encrypt        = true
  }
}

provider "aws" {
  region     = "ap-northease-2"
  access_key = var.access_key
  secret_key = var.secret_key
}
