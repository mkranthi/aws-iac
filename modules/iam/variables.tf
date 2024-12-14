variable "role_name" {
    description = "this is the role creating for s3 bucket access for ec2"
    type = string
}

variable "iam_policy" {
    description = "policy give access to s3 bucket"
    type = string
}
variable "kms_role" {
    description = "this is the role creating for kms_key admin"
    type = string
}
variable "kms_key_arn" {
  description = "The ARN of the KMS key"
  type        = string
}
variable "iam_instance_profile" {
  description = "instanceprofile name"
  type        = string  
}