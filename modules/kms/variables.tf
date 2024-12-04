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