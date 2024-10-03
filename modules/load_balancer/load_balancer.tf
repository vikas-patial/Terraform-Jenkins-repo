# Create Application Load Balancer
resource "aws_lb" "app_lb" {
  name               = var.load_balancer_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_group_id]
  subnets            = [var.public_subnet, var.private_subnet]

  enable_deletion_protection = false


  tags = {
    Name = var.load_balancer_name
  }
}

# Create Listener for Load Balancer
resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.app_lb.id
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = var.lb_target_group_arn
  }
}

# Create the IAM Role
resource "aws_iam_role" "elb_logging_role" {
  name = "elb_logging_to_s3"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "elasticloadbalancing.amazonaws.com"  # Allow ELB service to assume the role
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# Create the IAM Policy to allow ELB to send logs to S3
resource "aws_iam_policy" "elb_s3_logging_policy" {
  name        = "elb_s3_logging_policy"
  description = "Policy for ELB to send logs to S3 bucket"
  
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "s3:PutObject",
          "s3:PutObjectAcl"  # ELB needs to be able to set object ACLs for logging
        ],
        Resource = "${var.s3_bucket_arn}/*"  # Use the passed S3 bucket ARN
      }
    ]
  })
}

# Attach the policy to the role
resource "aws_iam_role_policy_attachment" "attach_elb_logging_policy" {
  role       = aws_iam_role.elb_logging_role.name
  policy_arn = aws_iam_policy.elb_s3_logging_policy.arn
}

# Create S3 Bucket Policy
resource "aws_s3_bucket_policy" "elb_logging_policy" {
  bucket = var.bucket  # Reference to your S3 bucket name or ID

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "elasticloadbalancing.amazonaws.com"  # Allow ELB service to write to the bucket
        },
        Action = "s3:PutObject",
        Resource = "${var.s3_bucket_arn}/*",
      }
    ]
  })
}
