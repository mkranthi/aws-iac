output "kms_key_enable_key_rotation" {
  description = "Whether key rotation is enabled for the KMS key"
  value       = aws_kms_key.dev_kms_key.enable_key_rotation
}
output "ebs_kms_key_arn" {
  description = "ARN of the EBS KMS key"
  value       = aws_kms_key.ebs_kms_key.arn
}
output "s3_kms_key_arn" {
  description = "ARN of the S3 KMS key"
  value = aws_kms_key.s3_kms_key.arn
}