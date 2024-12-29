variable "bucket_name" {
    description = "s3 Bucket Name"
    type = string
}
variable "s3_kms_key_arn" {
  description = "KMS key ARN"
  type        = string
}
variable "iam_role_name" {
  description = "The name of the IAM role allowed to use the KMS key"
  type        = string
}

variable "admin_role_name" {
  description = "The name of the IAM role allowed to administer the KMS key"
  type        = string
}

variable "admin_user_name" {
  description = "The name of the IAM user allowed to administer the KMS key"
  type        = string
}

variable "aws_account_id" {
  description = "AWS Account ID"
  type        = string
}