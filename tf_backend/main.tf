provider "aws" {
  region  = "ap-northeast-2"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "comroom-terraform-state"

  lifecycle {
    prevent_destroy = true
  }

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "comroom-terraform-state-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

terraform {
  backend "s3" {
    bucket         = "comroom-terraform-state"
    key            = "global/s3/terraform_backend.tfstate"
    region         = "ap-northeast-2"
    dynamodb_table = "comroom-terraform-state-locks"
    encrypt        = true
  }
}

output "s3_bucket_arn" {
  value = aws_s3_bucket.terraform_state.arn
}

output "dynamodb_table_name" {
  value = aws_dynamodb_table.terraform_locks.name
}