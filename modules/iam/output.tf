output "iam_instance_profile_name" {
  value = aws_iam_instance_profile.my_instance_profile.name
}

output "iam_role_name" {
  value = aws_iam_role.kms.name
}
