output "kms_key_arn" {
  description = "The ARN of the KMS key"
  value       = aws_kms_key.dev_kms_key.arn
}

output "kms_key_id" {
  description = "The ID of the KMS key"
  value       = aws_kms_key.dev_kms_key.key_id
}

output "kms_key_alias" {
  description = "The alias of the KMS key"
  value       = aws_kms_key.dev_kms_key.key_usage
}