output "ebs_kms_key_arn" {
  description = "ARN of the EBS KMS key"
  value       = aws_kms_key.ebs_kms_key.arn
}