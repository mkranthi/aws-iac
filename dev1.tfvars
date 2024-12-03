role_name = "dev1_s3_role"
iam_policy = "dev1_s3_role_policy"
ami = "ami-02bf8ce06a8ed6092"
instance_type = "t2.micro"
instance_name = "terraform_dev1_instance"
key_name = "k8-key"
avzone = "us-east-2a"

description             = "Development environment KMS key"
deletion_window_in_days = 7
enable_key_rotation     = true
iam_administrators      = ["arn:aws:iam::123456789012:user/DevAdmin"]
iam_users               = ["arn:aws:iam::123456789012:user/DevUser"]
