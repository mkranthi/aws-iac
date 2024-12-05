resource "aws_s3_bucket" "kranti-bucket-2" {
  bucket = var.bucket_name

  tags = {
    Name        = var.bucket_name
  }
}
