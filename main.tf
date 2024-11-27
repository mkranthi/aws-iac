provider "aws" {
    region = "us-east-2"
  
}

terraform {
  backend "s3" { 
    region = "us-east-2"  
  }
}

module "ec2" {
    source = "./modules/ec2"
    
    vpc_id = var.vpc_id
    security_group_name = var.security_group_name
    from_port = var.from_port
    to_port = var.to_port
    ip_protocol = var.ip_protocol
    role_name = var.role_name
    instance_name = var.instance_name
    instance_type = var.instance_type
    ami = var.ami 
    key_name = var.key_name
    instance_profile_name = "default-instance-profile"
    
}
