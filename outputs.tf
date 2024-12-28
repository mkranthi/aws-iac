output "kms_key_arn" {
  description = "ARN of the EBS KMS key"
  value       = module.ebs_kms.kms_key_arn
}