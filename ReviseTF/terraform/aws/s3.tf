resource "aws_s3_bucket" "mytest" {
  bucket = "charlie-tf-test-bucket"
  tags = {
    Name        = "mybucket"
    environment = "Dev"
  }

}


resource "aws_dynamodb_table" "terraform-lock" {
  name           = "tfstate_teraform"
  hash_key       = "LockID"
  write_capacity = 5
  read_capacity  = 5
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    Name = "lock for dyno db"
  }

}