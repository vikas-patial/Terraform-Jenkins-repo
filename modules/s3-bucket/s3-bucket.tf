# Specify the required provider
provider "aws" {
  region = "us-east-1"
}

# Create an S3 bucket
resource "aws_s3_bucket" "my_terra_log_buc" {
  bucket = "my-terra-log-buc"  # Ensure this name is globally unique
  tags = {
    Name = "MyTerraformBucket"
  }
}

# Set ownership controls for the bucket
resource "aws_s3_bucket_ownership_controls" "mybucket_ownership" {
  bucket = aws_s3_bucket.my_terra_log_buc.id

  rule {
    object_ownership = "BucketOwnerPreferred"  
  }
}

# Configure public access settings for the bucket
resource "aws_s3_bucket_public_access_block" "mybucket_public_access" {
  bucket = aws_s3_bucket.my_terra_log_buc.id

  block_public_acls       = false
  ignore_public_acls      = false
  block_public_policy     = false
  restrict_public_buckets = false
}

# Create a bucket policy to allow logging from AWS services
resource "aws_s3_bucket_policy" "my_terra_log_buc_policy" {
  bucket = aws_s3_bucket.my_terra_log_buc.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "logs.amazonaws.com"  # Allow CloudWatch Logs to write to the bucket
        }
        Action = "s3:PutObject"
        Resource = "${aws_s3_bucket.my_terra_log_buc.arn}/*"
      },
      {
        Effect = "Allow"
        Principal = {
          Service = "elasticloadbalancing.amazonaws.com"  # Allow ELB logs
        }
        Action = "s3:PutObject"
        Resource = "${aws_s3_bucket.my_terra_log_buc.arn}/*"
      }
    ]
  })
}

