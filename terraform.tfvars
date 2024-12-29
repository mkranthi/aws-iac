role_name                  = "kranti_s3_role"
iam_policy                 = "kranti_s3_role_policy"
enable_key_rotation        = true
ami                        = "ami-02bf8ce06a8ed6092"
instance_type              = "t2.micro"
key_name                   = "k8-key"
instance_name              = "terraform_instance"
iam_instance_profile       = "terraform_instance_profile"
avzone                     = "us-east-1a"
v_size                     = 2
volumename                 = "terraform_ebs_volume"
d_name                     = "/dev/sdh"
vpc_id                     = "vpc-4decb125"
security_group_name        = "terraform_kms_sg"
to_port                    = 22
from_port                  = 22
ip_protocol                = "tcp"
admin_role_name            = "ec2-adminrole"
admin_user_name            = "kranthi"
aws_account_id             = "695564319977"
kms_key_name                = "ebs_kms_key"
#bucket_name                = "kranti_bucket_for_kms_123456"