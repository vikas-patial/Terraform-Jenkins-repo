# Create Launch Configuration
resource "aws_launch_configuration" "app_launch_configuration" {
  name            = "app-launch-configuration"
  image_id        = var.ami
  instance_type   = var.instance_type
  security_groups = [var.security_group_id]
  key_name        = var.key_pair_name 
  associate_public_ip_address = true 
  lifecycle {
    create_before_destroy = true
  }



  user_data = <<-EOF
              #!/bin/bash
              # Update packages
              set -e
              sudo su -
              apt-get update -y
              
              # Install Docker
              apt-get install -y docker.io
              systemctl start docker
              systemctl enable docker
 
              # Install Git
              apt-get install git -y
             
              #Directory for app
              mkdir -p /home/ubuntu/app

              # Clone your docker file from github
              git clone https://github.com/vikas-patial/docker-AWS--elastic-beanstalk.git  /home/ubuntu/app

              # Change to the app directory
              cd /home/ubuntu/app

              # Build the Docker image 
              docker build -t ec2_image .

              # Run the Docker container 
              docker run -d -p 80:80 ec2_image
              EOF
}

