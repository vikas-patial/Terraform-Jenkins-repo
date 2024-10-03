# Specify the required provider
provider "aws" {
  region = "us-east-1" 
}

# Reference to existing security group
data "aws_security_group" "ec2_sg" {
  id = var.security_group_id
}

# Reference to existing subnet
data "aws_subnet" "public_subnet" {   
  id = var.public_subnet
}

data "aws_subnet" "private_subnet" {   
  id = var.private_subnet
}


# Create a DB Subnet Group using the public subnet
resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "my-rds-subnet-group"
  subnet_ids = [
    data.aws_subnet.public_subnet.id,
    data.aws_subnet.private_subnet.id
  ]
  description = "Subnet group for RDS instance"
}

# Create the RDS instance
resource "aws_db_instance" "my_db" {
  identifier              = "mydbinstance"
  engine                  = "mysql" 
  instance_class          = "db.t3.micro" 
  allocated_storage       = 20 # Size in GB
  db_subnet_group_name    = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids  = [data.aws_security_group.ec2_sg.id]

  username                = var.db_username  
  password                = var.db_password  
  db_name                 = "mydatabase"     
  skip_final_snapshot     = true 
}
