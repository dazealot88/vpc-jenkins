
# Creating Our Dynamo Database Table
resource "aws_dynamodb_table" "state_lock" {
  name         = "state_lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}