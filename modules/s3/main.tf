resource "aws_s3_bucket" "mybucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  bucket = aws_s3_bucket.mybucket.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = var.s3_kms_key_arn
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_s3_bucket_policy" "mybucket_policy" {
  bucket = aws_s3_bucket.mybucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "BucketAccess"
        Effect    = "Allow"
        Principal = {
          AWS = "arn:aws:iam::${var.aws_account_id}:role/${var.iam_role_name}"
        }
        Action    = [
          "s3:ListBucket",         # Allows listing objects in the bucket
          "s3:DeleteBucket",       # Allows deleting the bucket
          "s3:PutBucketPolicy",    # Allows putting the bucket policy
          "s3:PutBucketEncryption" # Allows modifying the bucket encryption settings
        ]
        Resource  = "arn:aws:s3:::${aws_s3_bucket.mybucket.bucket}"  # Bucket ARN
      },
      {
        Sid       = "AllowObjectActions"
        Effect    = "Allow"
        Principal = "*"
        Action    = [
          "s3:PutObject",   # Allows uploading objects
          "s3:GetObject",   # Allows downloading objects
          "s3:DeleteObject" # Allows deleting objects
        ]
        Resource  = "arn:aws:s3:::${aws_s3_bucket.mybucket.bucket}/*"  # Object ARN (everything inside the bucket)
      }
    ]
  })
}
