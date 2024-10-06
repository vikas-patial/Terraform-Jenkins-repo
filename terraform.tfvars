#Reusable

# provider region
provider_region = "us-east-1"

# infrastructure Configuration ami,region and instance_type
instance_type = "t2.micro"
ami           = "ami-0e86e20dae9224db8"
region        = "us-east-1"

# ports for security group
port = [22, 80, 443, 8080]

# vpc name 
vpc_name = "my-jenkins-vpc"

# target group name
target_group = "app-target-group"

# autoscalling name  
autoscaling_name = "vikas_autoscalling_group"

# loadbalancer name 
load_balancer_name = "app-lb"

# security group
security_group_name = "ec2_sg"

# key pair name 
key_pair_name   = "my-key-pair"
key_pair_tag    = "my-keyy"
public_key_path = "./id_rsa.pub"

# db_username and pass
db_username = "db_user"
db_password = "db-pass"


