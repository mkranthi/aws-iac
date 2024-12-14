resource "aws_kms_key" "dev_kms_key" {
  description             = "Creating a Terraform KMS key for the new module"
  deletion_window_in_days = var.deletion_window_in_days
  enable_key_rotation     = var.enable_key_rotation

  policy = jsonencode({
    Version   = "2012-10-17",
    Id        = "key-default-1",
    Statement = [
      {
        Sid       = "Enable IAM User Permissions",
        Effect    = "Allow",
        Principal = {
          AWS = "arn:aws:iam:::role/${var.iam_role_name}"
        },
        Action   = "kms:*",
        Resource = "*"
      },
      {
        Sid       = "Allow administration of the key",
        Effect    = "Allow",
        Principal = {
          AWS = [
            "arn:aws:iam:::role/${var.admin_role_name}",
            "arn:aws:iam:::user/${var.admin_user_name}"
          ]
        },
        Action   = [
          "kms:ReplicateKey",
          "kms:Create*",
          "kms:Describe*",
          "kms:Enable*",
          "kms:List*",
          "kms:Put*",
          "kms:Update*",
          "kms:Revoke*",
          "kms:Disable*",
          "kms:Get*",
          "kms:Delete*",
          "kms:ScheduleKeyDeletion",
          "kms:CancelKeyDeletion",
          "kms:EnableKeyRotation",
          "kms:DescribeKey"
        ],
        Resource = "*"
      },
      {
        Sid       = "Allow use of the key",
        Effect    = "Allow",
        Principal = {
          AWS = "arn:aws:iam:::role/${var.iam_role_name}"
          
        },
        Action   = [
          "kms:DescribeKey",
          "kms:Encrypt",
          "kms:Decrypt",
          "kms:ReEncrypt*",
          "kms:GenerateDataKey",
          "kms:EnableKeyRotation",
          "kms:GenerateDataKeyWithoutPlaintext"
        ],
        Resource = "*"
      },
      {
        Sid       = "Allow key administration by root account", 
        Effect    = "Allow",
        Principal = {
          AWS = "arn:aws:iam:::root"
        },
        Action   = "kms:PutKeyPolicy", 
        Resource = "*"
      }
    ]
  })
}