output "instance_id" {
  value = aws_instance.terraform_instance.id
  description = "The ID of the EC2 instance"
}
