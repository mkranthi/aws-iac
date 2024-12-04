output "iam_instance_profile_name" {
  description = "The name of the IAM instance profile"
  value       = aws_iam_instance_profile.my_instance_profile.name
}

output "role_name" {
  description = "The name of the primary IAM role"
  value       = aws_iam_role.iam_role.name
}

output "kms_role" {
  description = "The name of the KMS IAM role"
  value       = aws_iam_role.kms.name
}
