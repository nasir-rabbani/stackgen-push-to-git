resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
  tags = {
    owner = "nsrk"
  }
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_acls       = true
  block_public_policy     = var.block_public_policy
  ignore_public_acls      = true
  restrict_public_buckets = true
}