output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "security_group_id" {
  description = "The ID of the security group"
  value       = module.security_group.security_group_id
}

output "launch_configuration_id" {
  description = "The ID of the launch configuration"
  value       = module.launch_configuration.launch_configuration
}

output "auto_scaling_group_id" {
  description = "The ID of the auto scaling group"
  value       = module.auto_scaling_group.auto_scaling_group_id
}

output "load_balancer_id" {
  description = "The ID of the load balancer"
  value       = module.load_balancer.load_balancer_arn
}
output "s3_bucket_arn" {
  description = "The ARN of the S3 bucket"
  value       = module.s3-bucket.s3_bucket_arn
}

output "target_group_arn" {
  description = "The ARN of the target group"
  value       = module.target_group.lb_target_group_arn
}

output "load_balancer_arn" {
  description = "The ARN of the load balancer"
  value       = module.load_balancer.load_balancer_arn
}
