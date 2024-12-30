resource "aws_s3_bucket_policy" "mybucket_policy" {
  bucket = aws_s3_bucket.mybucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      # Allow specific roles and users to access the bucket
      {
        Sid       = "AllowSpecificUsers"
        Effect    = "Allow"
        Principal = {
          AWS = [
            "arn:aws:iam::${var.aws_account_id}:role/${var.iam_role_name}",
            "arn:aws:iam::${var.aws_account_id}:user/${var.admin_user_name}",
            "arn:aws:iam::${var.aws_account_id}:user/${var.admin_role_name}"
          ]
        }
        Action    = [
          "s3:ListBucket",
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject"
        ]
        Resource = [
          "arn:aws:s3:::${aws_s3_bucket.mybucket.id}",
          "arn:aws:s3:::${aws_s3_bucket.mybucket.id}/*"
        ]
      },
      # Deny access to everyone else
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
          "arn:aws:s3:::${aws_s3_bucket.mybucket.id}",
          "arn:aws:s3:::${aws_s3_bucket.mybucket.id}/*"
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
