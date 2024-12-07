This  is iam file for kms
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

# Creating IAM Policy for Role
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
        Action   = [
          "kms:DescribeKey",
          "kms:Encrypt",
          "kms:Decrypt",
          "kms:ReEncrypt*",
          "kms:GenerateDataKey",
          "kms:GenerateDataKeyWithoutPlaintext"
        ]
        Effect   = "Allow"
        Resource = module.kms.kms_key_arn  # Referencing KMS key ARN
      }
    ]
  })
}

# Attaching Policy and Role
resource "aws_iam_policy_attachment" "policy_attachment" {
  name       = "${var.role_name}_attachment"
  roles      = [aws_iam_role.iam_role.name]
  policy_arn = aws_iam_policy.iam_policy.arn
}

# Creating Instance Profile
resource "aws_iam_instance_profile" "my_instance_profile" {
  name = "${var.role_name}_instance_profile"
  role = aws_iam_role.iam_role.name
}

# Creating KMS Role (same as existing code)
resource "aws_iam_role" "kms" {
  name = var.kms_role
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action   = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name = var.kms_role
  }
}