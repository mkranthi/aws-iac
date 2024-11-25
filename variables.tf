variable "vpc_id" {
  description = "The ID of the VPC where resources will be created"
  type        = string
}

variable "security_group_name" {
  description = "Name of the security group"
  type        = string
}

variable "from_port" {
  description = "Ingress rule start port"
  type        = number
}

variable "to_port" {
  description = "Ingress rule end port"
  type        = number
}

variable "ip_protocol" {
  description = "Protocol for the security group rule"
  type        = string
}

variable "role_name" {
  description = "The name of the IAM role to attach to the instance profile"
  type        = string
}

variable "instance_type" {
  description = "Type of the EC2 instance"
  type        = string
}

variable "ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "key_name" {
  description = "Name of the key pair to use for the instance"
  type        = string
}
variable "instance_profile_name" {
  description = "The instance profile name for the EC2 instance"
  type        = string
}

variable "av_zone" {
  description = "The availability zone for the resources"
  type        = string
}
variable "ENVIRONMENT" {
  description = "The availability zone for the resources"
  type        = string
}
