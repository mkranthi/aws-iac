output "instance_id" {
  value = module.ec2.instance_id
}

output "instance_profile_name" {
  value = module.ec2.instance_profile_name
}

output "security_group_id" {
  value = module.ec2.security_group_id
}

output "instance_arn" {
  value = module.ec2.terraform_instance_arn
}

output "public_ip" {
  value = module.ec2.terraform_instance.public_ip
}

output "public_dns" {
  value = module.ec2.terraform_instance.public_dns
}


