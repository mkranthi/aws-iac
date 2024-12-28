provider "aws" {
  region = "us-east-2"
}

data "aws_vpc" "selected" {
  id = var.vpc_id
}
resource "aws_security_group" "terraform-sg" {
    vpc_id = var.vpc_id
    description = "this security group is for ec2-instance"

    tags = {
      Name = var.security_group_name
    }

}
resource "aws_vpc_security_group_ingress_rule" "ssh" {
    security_group_id = aws_security_group.terraform-sg.id
    to_port           = var.to_port
    from_port         = var.from_port
    cidr_ipv4         = data.aws_vpc.selected.cidr_block
    ip_protocol       = var.ip_protocol
}
resource "aws_vpc_security_group_egress_rule" "egress_rule" {
    security_group_id = aws_security_group.terraform-sg.id
    cidr_ipv4 = "0.0.0.0/0"
    ip_protocol = "-1"
}

# EC2 Instance creation
resource "aws_instance" "terraform_instance" {
  instance_type      = var.instance_type
  ami                = var.ami
  key_name           = var.key_name
  iam_instance_profile = var.iam_instance_profile
  vpc_security_group_ids = [aws_security_group.terraform-sg.id]
  availability_zone = var.avzone

  tags = {
    Name = var.instance_name
  }
}

# EBS Volume creation
resource "aws_ebs_volume" "ebs_volume" {
  availability_zone = var.avzone
  size              = var.v_size
  kms_key_id        = module.kms.ebs_kms_key_arn
  encrypted         = true
  tags = {
    name = var.volumename
  }
}

# Attaching EBS Volume to EC2 Instance
resource "aws_volume_attachment" "ebs_attach" {
  device_name = var.d_name
  volume_id   = aws_ebs_volume.ebs_volume.id
  instance_id = aws_instance.terraform_instance.id
}