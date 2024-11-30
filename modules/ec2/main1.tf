

resource "aws_instance" "terraform_instance" {
  ami                = var.ami
  instance_type      = var.instance_type
  key_name           = var.key_name
  iam_instance_profile = var.iam_instance_profile
  
  tags = {
    Name = var.instance_name
  }
}
