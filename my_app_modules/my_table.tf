# DynamoDB Table

resource "aws_dynamodb_table" "name" {
  name = "${var.my_env}-my-tfam-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "id"
  attribute {
    name = "id"
    type = "S"
  }
}