provider "aws" {
  region = "us-east-2"
}

terraform {
  backend "s3" {
    bucket = "kranti-terraform-statefile" 
    key    = "terraform/terraform.tfstate"  
    region = "us-east-2"  
}
}

module "iam" {
  source = "./modules/iam"
  role_name  = var.role_name
  iam_policy = var.iam_policy
}

module "ec2-instance" {
  source             = "./modules/ec2-instance"
  instance_type      = var.instance_type
  instance_name      = var.instance_name
  key_name           = var.key_name
  ami                = var.ami
  iam_instance_profile = module.iam.iam_instance_profile_name
  avzone      = var.avzone
  v_size      = var.v_size
  d_name      = var.d_name
  volumename  = var.volumename
  vpc_id = var.vpc_id
    security_group_name = var.security_group_name
    to_port = var.to_port
    from_port = var.from_port
    ip_protocol = var.ip_protocol 
}
