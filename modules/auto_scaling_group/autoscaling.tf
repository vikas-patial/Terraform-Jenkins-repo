
# Create Auto Scaling Group
resource "aws_autoscaling_group" "app_asg" {
  name                 = var.autoscaling_name
  launch_configuration = var.launch_configuration
  min_size             = 1
  max_size             = 3
  desired_capacity     = 2
  vpc_zone_identifier  = [var.public_subnet]
  
  tag {
    key                 = "Name"
    value               = var.autoscaling_name
    propagate_at_launch = true
  }
}

# Attach Target Group to Auto Scaling Group
resource "aws_autoscaling_attachment" "app_attach" {
  autoscaling_group_name = aws_autoscaling_group.app_asg.id
  lb_target_group_arn    = var.lb_target_group_arn
}
