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
module "kms" {
  source = "./modules/kms"

  description             = "KMS key for development environment"
  deletion_window_in_days = 30
  enable_key_rotation     = true
  iam_administrators      = ["arn:aws:iam::123456789012:user/Alice"]
  iam_users               = ["arn:aws:iam::123456789012:user/Bob"]
}

module "ec2" {
  source             = "./modules/ec2"
  instance_type      = var.instance_type
  instance_name      = var.instance_name
  key_name           = var.key_name
  ami                = var.ami
  iam_instance_profile = module.iam.iam_instance_profile_name

}
