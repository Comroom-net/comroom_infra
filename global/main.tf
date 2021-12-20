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
    key            = "prod/global/terraform.tfstate"
    region         = "ap-northeast-2"
    dynamodb_table = "comroom-terraform-state-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = "ap-northeast-2"
}
