resource "aws_dynamodb_table" "schedule" {
  name         = "comroom_schedule"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "School_id"

  attribute {
    name = "School_id"
    type = "N"
  }

  tags = {
    Environment = "prod"
  }
}
