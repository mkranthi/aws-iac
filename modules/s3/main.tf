resource "aws_s3_bucket" "additional_s3_bucket" {
  bucket = var.bucket_name

  tags = {
    Name = var.bucket_name
  }

  # Enable KMS Encryption
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "aws:kms"
        kms_master_key_id = aws_kms_key.s3_key.key_id
      }
    }
  }
}