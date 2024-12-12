# IAM Role for EC2 Instances
resource "aws_iam_role" "iam_role" {
  name = var.role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Name = var.role_name
  }
}

# IAM Policy for EC2 Role (Including KMS Permissions)
resource "aws_iam_policy" "iam_policy" {
  name   = var.iam_policy
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:ListBucket",
          "s3:ListAllMyBuckets",
          "s3:PutObject",
          "s3:GetObject",
          "s3:DeleteObject"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Action = [
          "kms:DescribeKey",
          "kms:Encrypt",
          "kms:Decrypt",
          "kms:ReEncrypt*",
          "kms:GenerateDataKey",
          "kms:GenerateDataKeyWithoutPlaintext",
          "kms:EnableKeyRotation",  # EC2 role needs permission to enable key rotation
          "kms:ListAliases"         # Allow EC2 to list key aliases if needed
        ]
        Effect   = "Allow"
        Resource = var.kms_key_arn  # Dynamically referencing KMS key ARN
      }
    ]
  })
}

# Attach IAM Policy to EC2 Role
resource "aws_iam_policy_attachment" "policy_attachment" {
  name       = "${var.role_name}_attachment"
  roles      = [aws_iam_role.iam_role.name]
  policy_arn = aws_iam_policy.iam_policy.arn
}

# IAM Instance Profile for EC2
resource "aws_iam_instance_profile" "my_instance_profile" {
  name = "${var.role_name}_instance_profile"
  role = aws_iam_role.iam_role.name
}