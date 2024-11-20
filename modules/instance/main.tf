provider "aws" {
    region = "us-east-2"
}

# Fetch the existing VPC
data "aws_vpc" "selected" {
    id = var.vpc_id
}

# Security group creation
resource "aws_security_group" "terraform_sg" {
    vpc_id     = var.vpc_id
    description = "this is the security group for ec2_instance"

    tags = {
        Name = var.security_group_name
    }
}

# Security group ingress rule (SSH access)
resource "aws_vpc_security_group_ingress_rule" "ssh" {
    security_group_id = aws_security_group.terraform_sg.id
    from_port         = var.from_port
    to_port           = var.to_port
    cidr_ipv4         = data.aws_vpc.selected.cidr_block
    ip_protocol       = var.ip_protocol
}

# Security group egress rule (Outbound access)
resource "aws_vpc_security_group_egress_rule" "outbound" {
    security_group_id = aws_security_group.terraform_sg.id
    cidr_ipv4 = "0.0.0.0/0"
    ip_protocol       = "-1"
}

# Reference to the existing IAM role
data "aws_iam_role" "existing_role" {
    name = var.role_name
}

# Instance profile using the existing IAM role
#resource "aws_iam_instance_profile" "instance_profile" {
#  name = var.instance_profile
#  role = data.aws_iam_role.existing_role.name
#}

data "aws_iam_instance_profile" "existing_instance_profile" {
    name = var.instance_profile_name
}

# EC2 instance creation
resource "aws_instance" "terraform_instance" {
    instance_type            = var.instance_type
    ami                      = var.ami
    key_name                 = var.key_name
    availability_zone        = var.av_zone
    vpc_security_group_ids   = [aws_security_group.terraform_sg.id]
    iam_instance_profile_name     = data.aws_iam_instance_profile.existing_instance_profile.name

    tags = {
      Name = var.instance_name
    }
}
