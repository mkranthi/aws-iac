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
      # Deny all other users and roles from accessing the bucket
      {
        Sid       = "DenyOtherUsers"
        Effect    = "Deny"
        Principal = "*"
        Action    = [
          "s3:ListBucket",
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject"
        ]
        Resource = [
          "arn:aws:s3:::${aws_s3_bucket.mybucket.bucket}",
          "arn:aws:s3:::${aws_s3_bucket.mybucket.bucket}/*"
        ]
        Condition = {
          StringNotEquals = {
            "aws:PrincipalArn": [
              "arn:aws:iam::${var.aws_account_id}:role/${var.iam_role_name}",
              "arn:aws:iam::${var.aws_account_id}:user/${var.admin_user_name}",
              "arn:aws:iam::${var.aws_account_id}:user/${var.admin_role_name}"
            ]
          }
        }
      }
    ]
  })
}