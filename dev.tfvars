role_name = "kranti_dev_s3_role"
kms_role                   = "kms_admin_role"
iam_policy = "dev_s3_role_policy"
deletion_window_in_days    = 10
enable_key_rotation        = true

ami = "ami-02bf8ce06a8ed6092"
instance_type = "t2.micro"
instance_name = "terraform_kms_dev_instance"
key_name = "k8-key"
iam_instance_profile      = "terraform_instance_profile"
avzone = "us-east-2a"

v_size = 2
d_name =   "/dev/sdh"
volumename = "terraform_ebs_volume"
vpc_id = "vpc-4decb125"
security_group_name = "terraform_kms_sg"
to_port = 22
from_port = 22
ip_protocol = "tcp"
