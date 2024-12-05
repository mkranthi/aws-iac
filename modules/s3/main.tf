resource "aws_s3_bucket" "kranti-bucket-2" {
  bucket = var.bucket_name
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "aws:kms"
        kms_master_key_id = var.kms_key_id
      }
    }
  }

  tags = {
    Name        = var.bucket_name
  }
}
