variable "ami" {
  description = "ami id for instance_type"
  type = string
}
variable "instance_type" {
  description = "instance type"
  type = string
}
variable "key_name" {
  description = "key for login"
  type =   string
}
variable "instance_name" {
    description = "name of instance"
   type = string  
}
variable "iam_instance_profile" {
  description = "The IAM instance profile to attach to the EC2 instance"
  type        = string
}

