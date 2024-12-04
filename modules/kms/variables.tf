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

variable "iam" {
  description = "IAM details including role_name and kms_role"
  type = object({
    role_name = string
    kms_role  = string
  })
}
