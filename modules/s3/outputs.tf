output "bucket_name" {
  description = "The name of the primary IAM role"
  value       = aws_s3_bucket.mybucket
}
output "s3_bucket_arn" {
  description = "The ARN of the S3 bucket"
  value       = aws_s3_bucket.mybucket.arn
}