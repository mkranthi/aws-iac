output "iam_role_name" {
  description = "The name of the IAM role"
  value       = data.aws_iam_role.existing_role.name
}

output "instance_profile_name" {
  description = "The name of the instance profile"
  value       = data.aws_iam_instance_profile.existing_instance_profile.name
}

output "security_group_id" {
  description = "The ID of the security group"
  value       = aws_security_group.terraform_sg.id
}

output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.terraform_instance.id
}

output "instance_arn" {
  description = "The instance arn of the EC2-instance"
  value = aws_instance.terraform_instance.arn
}

output "public_ip" {
  description = "The Public_ip of the EC2-instance"
  value = aws_instance.terraform_instance.public_ip
}

output "public_dns" {
  description = "The public_dns arn of the EC2-instance"
  value = aws_instance.terraform_instance.public_dns
}
