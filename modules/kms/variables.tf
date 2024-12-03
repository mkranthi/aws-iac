variable "kms_description" {
  type        = string
  description = "Description for the KMS key"
  default     = "creating first kms key for terraform project"
}

variable "deletion_window_in_days" {
  type        = number
  description = "Number of days before the key is deleted after scheduling"
  default     = 7
}

variable "enable_key_rotation" {
  type        = bool
  description = "Flag to enable key rotation"
  default     = true
}

variable "key_admins" {
  type        = list(string)
  description = "List of IAM users with administrative permissions on the KMS key"
  default     = ["Alice"]
}

variable "key_users" {
  type        = list(string)
  description = "List of IAM users with usage permissions on the KMS key"
  default     = ["Bob"]
}
