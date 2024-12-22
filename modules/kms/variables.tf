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

variable "enable_key_rotation" {
  description = "Flag to enable automatic rotation of the KMS key"
  type        = bool
  default     = true
}
variable "aws_account_id" {
  description = "AWS Account ID"
  type        = string
}