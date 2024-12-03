role_name = "dev_s3_role"
iam_policy = "dev_s3_role_policy"
ami = "ami-02bf8ce06a8ed6092"
instance_type = "t2.micro"
instance_name = "terraform_dev_instance"
key_name = "k8-key"
avzone = "us-east-2a"

description             = "Development environment KMS key"
deletion_window_in_days = 7
enable_key_rotation     = true

iam_kms_role  = "my_kms_role"
aws_role_name = "my_role_name"