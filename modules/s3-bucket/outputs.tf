# Output the bucket ID

output "bucket" {
  value = aws_s3_bucket.my_terra_log_buc.id
}

# Output the bucket ARN
output "s3_bucket_arn" {
  value = aws_s3_bucket.my_terra_log_buc.arn
}

