variable "vpc_id" {
  description = "The ID of the VPC where resources will be created"
  type        = string
  default     = "vpc-12345678"
}

variable "security_group_name" {
  description = "Name of the security group"
  type        = string
  default     = "default-security-group"
}

variable "from_port" {
  description = "Ingress rule start port"
  type        = number
  default     = 22
}

variable "to_port" {
  description = "Ingress rule end port"
  type        = number
  default     = 22
}

variable "ip_protocol" {
  description = "Protocol for the security group rule"
  type        = string
  default     = "tcp"
}

variable "ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0c55b159cbfafe1f0"
}

variable "instance_type" {
  description = "Type of the EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Name of the key pair to use for the instance"
  type        = string
  default     = "my-default-key"
}

variable "av_zone" {
  description = "Availability zone for the EC2 instance"
  type        = string
  default     = "us-east-2a"
}

variable "instance_profile_name" {
  description = "IAM instance profile name"
  type        = string
  default     = "default-instance-profile"
}

variable "instance_name" {
  description = "Name tag for the EC2 instance"
  type        = string
  default     = "my-ec2-instance"
}

variable "role_name" {
  description = "Name of the existing IAM role to associate with the instance profile"
  type        = string
  default     = "existing-role-name"
}
