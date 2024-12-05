output "bucket_name" {
  description = "The name of the S3 bucket"
  value       = aws_s3_bucket.kranti-bucket-2.bucket
}
