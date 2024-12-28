output "kms_key_arn" {
  description = "ARN of the EBS KMS key"
  value       = module.ebs_kms.kms_key_arn
}
output "ec2_instance_public_ip" {
  description = "Public IP address of the created EC2 instance"
  value       = module.ec2.public_ip
}
output "iam_instance_profile_name" {
  description = "Instance profile name associated with the IAM role"
  value       = module.iam.iam_instance_profile_name
}
output "ec2_volume_id" {
  description = "ID of the EBS volume attached to the EC2 instance"
  value       = module.ec2.volume_id
}