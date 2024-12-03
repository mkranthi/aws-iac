variable "role_name" {
    description = "this is the role creating for s3 bucket access for ec2"
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

variable "description" {
  description = "Description of the KMS key"
  type        = string
}

variable "deletion_window_in_days" {
  description = "Number of days before deleting the key"
  type        = number
  default     = 7
}

variable "enable_key_rotation" {
  description = "Enable automatic key rotation"
  type        = bool
  default     = true
}

variable "iam_administrators" {
  description = "List of IAM users or roles with admin access to the key"
  type        = list(string)
}

variable "iam_users" {
  description = "List of IAM users allowed to use the key"
  type        = list(string)
}

variable "kms_role_name" {
    description = "this is the role creating for s3 bucket access for ec2"
    type = string
}

 