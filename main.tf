resource "aws_s3_bucket" "elblab-bucket" {
    bucket = "elblab2-118369402652-tfstates"

    lifecycle {
      prevent_destroy = true
    }

    tags = {
        Name = "elblab2-118369402652-tfstates"
        Environment = "minilab"
    }
}

resource "aws_s3_bucket_versioning" "version_my_bucket" {
  bucket = aws_s3_bucket.elblab-bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}


resource "aws_dynamodb_table" "terraform_lock_tbl" {
  name           = "terraform-lock"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags           = {
    Name = "terraform-lock"
  }
}

