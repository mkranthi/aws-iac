output "kms_key_arn" {
  description = "ARN of the EBS KMS key"
  value       = module.kms_key.arn
}