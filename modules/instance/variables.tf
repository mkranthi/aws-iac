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
  description = "The IAM role name"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
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
  description = "Availability zone for the EC2 instance"
  type        = string
}

variable "instance_name" {
  description = "Name of the EC2 instance"
  type        = string
}

