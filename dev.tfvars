role_name                  = "kranti_dev_kms_s3_role"
iam_policy                 = "dev_kms_s3_role_policy"
enable_key_rotation        = true
ami                        = "ami-02bf8ce06a8ed6092"
instance_type              = "t2.micro"
instance_name              = "terraform_kms_dev_instance"
key_name                   = "k8-key"
iam_instance_profile       = "terraform_kms_instance_profile"
avzone                     = "us-east-2b"
v_size                     = 2
d_name                     = "/dev/sdh"
volumename                 = "terraform_ebs_volume"
vpc_id                     = "vpc-4decb125"
security_group_name        = "terraform_kms_sg"
to_port                    = 22
from_port                  = 22
ip_protocol                = "tcp"
admin_role_name            = "ec2-adminrole"
admin_user_name            = "kranthi"
iam_role_name              = "kranti_dev_duplicate_kms_s3_role"
aws_account_id             = "695564319977"
#bucket_name               = "kranti_bucket_for_kms_123456"
kms_key_name               = "ebs_kms_key"
s3_kms_key_name            = "s3_kms_key"