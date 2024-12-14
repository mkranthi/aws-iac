output "kms_key_id" {
  description = "The ID of the KMS key"
  value       = aws_kms_key.dev_kms_key.key_id
}

output "kms_key_arn" {
  description = "The ARN of the KMS key"
  value       = aws_kms_key.dev_kms_key.arn
}

output "kms_key_description" {
  description = "The description of the KMS key"
  value       = aws_kms_key.dev_kms_key.description
}

output "kms_key_deletion_window_in_days" {
  description = "The deletion window for the KMS key"
  value       = aws_kms_key.dev_kms_key.deletion_window_in_days
}

output "kms_key_enable_key_rotation" {
  description = "Whether key rotation is enabled for the KMS key"
  value       = aws_kms_key.dev_kms_key.enable_key_rotation
}