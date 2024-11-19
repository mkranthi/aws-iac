output "instance_id" {
  value = module.ec2.instance_id
}

output "instance_profile_name" {
  value = module.ec2.instance_profile_name
}

output "security_group_id" {
  value = module.ec2.security_group_id
}
 output "public_ip" {
    value = module.aws_instance.public_ip
 }
