variable "role_name" {
    description = "this is the role creating for s3 bucket access for ec2"
    type = string
}
variable "kms_role" {
    description = "this is the role creating for kms_key admin"
    type = string
}

variable "iam_policy" {
    description = "policy give access to s3 bucket"
    type = string
}

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
variable "avzone" {
    description = "ebs volume where we created"
    type = string
}
variable "v_size" {
    description = "size of ebs_volume"
    type = number
}
variable "volumename" {
    description = "ebs_volume name"
    type = string
}
variable "d_name" {
    description = "ebs_volume_devicename"
    type = string
}
variable "vpc_id" {
    description = "vpc id "
    type = string
}
variable "security_group_name" {
    description = "security group name"
    type = string
}
variable "to_port" {
    description = "allow port number"
    type = number

}
variable "from_port" {
    description = "from_port number"
    type = number

}
variable "ip_protocol" {
    description = "name of protocol"
    type = string
}
variable "iam_role_name" {
  description = "The name of the IAM role allowed to use the KMS key"
  type        = string
}

variable "admin_role_name" {
  description = "The name of the IAM role allowed to administer the KMS key"
  type        = string
}

variable "admin_user_name" {
  description = "The name of the IAM user allowed to administer the KMS key"
  type        = string
}

variable "deletion_window_in_days" {
  description = "The number of days before the KMS key is deleted after scheduling deletion"
  type        = number
  default     = 30
}

variable "enable_key_rotation" {
  description = "Flag to enable automatic rotation of the KMS key"
  type        = bool
  default     = true
}
variable "aws_account_id" {
  description = "AWS Account ID"
  type        = string
}