vpc_id              = "vpc-4decb125"
security_group_name = "project7-sg"
from_port           = 22
to_port             = 22
ip_protocol         = "tcp"
ami                 = "ami-02bf8ce06a8ed6092"
av_zone             = "us-east-2b"
instance_name       = "terraform_instance"
role_name           = "default-instance-profile"
instance_type       = "t2.micro"
key_name            = "k8s-key"
instance_profile    = "default-instance-profile"
ENVIRONMENT         = "dev"

