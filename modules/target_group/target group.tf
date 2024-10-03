# Create Target Group

resource "aws_lb_target_group" "app_target_group" {
  name     = var.target_group
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = {
      name = var.target_group
  }
}

