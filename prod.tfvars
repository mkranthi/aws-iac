role_name                  = "kranti-prod-kms-s3-role"
iam_policy                 = "prod-kms-s3-role-policy"
enable_key_rotation        = true
ami                        = "ami-02bf8ce06a8ed6092"
instance_type              = "t2.micro"
instance_name              = "terraform-kms-prod-instance"
key_name                   = "k8-key"
iam_instance_profile       = "terraform-kms-prod-instance-profile"
avzone                     = "us-east-2b"
v_size                     = 2
d_name                     = "/dev/sdh"
volumename                 = "terraform-prod-ebs-volume"
vpc_id                     = "vpc-4decb125"
security_group_name        = "terraform-prod-kms-sg"
to_port                    = 22
from_port                  = 22
ip_protocol                = "tcp"
admin_role_name            = "ec2-adminrole"
admin_user_name            = "kranthi"
iam_role_name              = "kranti-prod-duplicate-kms-s3-role"
aws_account_id             = "695564319977"
bucket_name                = "kranti-prod-bucket-for-kms-123456"
kms_key_name               = "ebs-kms-prod-key"
s3_kms_key_name            = "s3-prod-kms-key"