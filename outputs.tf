output "kms_key_arn" {
  value = module.kms.kms_key_arn
}
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
output "instance_id" {
  value = aws_instance.terraform_instance.id
  description = "The ID of the EC2 instance"
}