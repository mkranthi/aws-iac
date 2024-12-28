output "kms_key_arn" {
  description = "ARN of the EBS KMS key"
  value       = module.ebs_kms.kms_key_arn
}

output "ec2_instance_public_ip" {
  description = "ARN of the EBS KMS key"
  value       = module.ec2.aws_instance.terraform_instance.public_ip
}