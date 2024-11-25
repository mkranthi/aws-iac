output "security_group_id" {
  description = "The ID of the security group"
  value       = aws_security_group.terraform_sg.id
}

output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.terraform_instance.id
}

output "iam_role_name" {
  description = "The name of the IAM role"
  value       = data.aws_iam_role.existing_role.name
}

output "instance_profile" {
  description = "The name of the IAM instance profile"
  value       = data.aws_iam_instance_profile.existing_instance_profile.name
}

