provider "aws" {
  region = "us-east-2"
}

# Fetch the existing VPC
data "aws_vpc" "selected" {
  id = var.vpc_id
}

# Security group creation
resource "aws_security_group" "terraform_sg" {
  vpc_id      = var.vpc_id
  description = "Security group for EC2 instance"

  tags = {
    Name = var.security_group_name
  }
}

# Security group ingress rule (SSH access)
resource "aws_security_group_rule" "ingress" {
  security_group_id = aws_security_group.terraform_sg.id
  from_port         = var.from_port
  to_port           = var.to_port
  protocol          = var.ip_protocol
  cidr_blocks       = [data.aws_vpc.selected.cidr_block]
}

# Security group egress rule (Outbound access)
resource "aws_security_group_rule" "egress" {
  security_group_id = aws_security_group.terraform_sg.id
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}


# EC2 instance creation
resource "aws_instance" "terraform_instance" {
  instance_type          = var.instance_type
  ami                    = var.ami
  key_name               = var.key_name
  availability_zone      = var.av_zone
  vpc_security_group_ids = [aws_security_group.terraform_sg.id]
  iam_instance_profile_name   = "default-instance-profile"

  tags = {
    Name = var.instance_name
  }
}

