resource "aws_dynamodb_table" "schedule" {
  name         = "comroom_schedule"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "school_id"

  attribute {
    name = "school_id"
    type = "N"
  }

  tags = {
    Environment = "prod"
  }
}
