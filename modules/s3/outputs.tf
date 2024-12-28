output "bucket_name" {
  description = "The name of the primary IAM role"
  value       = aws_s3_bucket.mybucket
}