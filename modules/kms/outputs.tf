output "kms_key_arn" {
  description = "ARN of the EBS KMS key"
  value       = aws_kms_key.kms_key.arn
}
