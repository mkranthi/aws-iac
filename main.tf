provider "aws" {
  region = "us-east-2"
}

terraform {
  backend "s3" { 
    region = "us-east-2"  
  }
}

# First declare the KMS module
module "ebs_kms" {
  source                  = "./modules/kms"
  enable_key_rotation     = var.enable_key_rotation
  iam_role_name           = module.iam.role_name
  admin_role_name         = var.admin_role_name
  admin_user_name         = var.admin_user_name
  aws_account_id          = var.aws_account_id
  kms_key_name            = var.kms_key_name  
}

# Then declare the IAM module
module "iam" {
  source = "./modules/iam"
  role_name  = var.role_name
  iam_policy = var.iam_policy
  kms_key_arn = module.ebs_kms.kms_key_arn
}
# Declare the EC2 module last, after IAM and KMS
module "ec2" {
  source                 = "./modules/ec2"
  instance_type          = var.instance_type
  instance_name          = var.instance_name
  key_name               = var.key_name
  ami                    = var.ami
  iam_instance_profile   = module.iam.iam_instance_profile_name
  kms_key_arn            = module.ebs_kms.kms_key_arn
  avzone                 = var.avzone
  v_size                 = var.v_size
  d_name                 = var.d_name
  volumename             = var.volumename
  vpc_id                 = var.vpc_id
  security_group_name    = var.security_group_name
  to_port                = var.to_port
  from_port              = var.from_port
  ip_protocol            = var.ip_protocol
}


module "s3" {
  source                  = "./modules/s3"
  bucket_name             = var.bucket_name
  s3_kms_key_arn          = module.s3_kms.kms_key_arn
  aws_account_id          = var.aws_account_id
  iam_role_name           = module.iam.role_name
  admin_role_name         = var.admin_role_name
  admin_user_name         = var.admin_user_name
}


module "s3_kms" {
  source                  = "./modules/kms"
  kms_key_name            = var.s3_kms_key_name
  enable_key_rotation     = var.enable_key_rotation
  iam_role_name           = module.iam.role_name
  admin_role_name         = var.admin_role_name
  admin_user_name         = var.admin_user_name
  aws_account_id          = var.aws_account_id
}
