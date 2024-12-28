variable "bucket_name" {
    description = "s3 Bucket Name"
    type = string
}
variable "s3_kms_key_arn" {
  description = "KMS key ARN"
  type        = string
}