output "iam_instance_profile_name" {
  value = aws_iam_instance_profile.my_instance_profile.name
}

output "iam_role_name" {
  value = aws_iam_role.kms.name
}
output "kms_role_name" {
  description = "The name of the KMS IAM role"
  value       = aws_iam_role.kms.name
}

output "role_name" {
  value = aws_iam_role.iam_role.name
}

output "kms_role" {
  value = aws_iam_role.kms_admin_role.name
}
