output "security_group_id" {
  description = "The ID of the security group"
  value       = aws_security_group.terraform_sg.id
}

output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.terraform_instance.id
}

output "instance_profile_name" {
  description = "The name of the IAM instance profile"
  value       = data.aws_iam_instance_profile.existing_instance_profile.name
}

