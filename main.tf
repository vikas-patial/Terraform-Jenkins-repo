# Module for VPC
module "vpc" {
  source   = "./modules/vpc"
  vpc_name = var.vpc_name
}

# module for S3 bucket
module "s3-bucket" {
  source = "./modules/s3-bucket"
}

# Call the key_pair module
module "key_pair" {
  source          = "./modules/key_pair"
  key_pair_name   = var.key_pair_name
  public_key_path = var.public_key_path
  key_pair_tag    = var.key_pair_tag
}

# Module for Security Group
module "security_group" {
  source              = "./modules/security_group"
  port                = var.port
  vpc_id              = module.vpc.vpc_id
  security_group_name = var.security_group_name
}

# Module for Launch Configuration
module "launch_configuration" {
  source            = "./modules/launch_configuration"
  security_group_id = module.security_group.security_group_id
  ami               = var.ami
  instance_type     = var.instance_type
  region            = var.region
  key_pair_name     = module.key_pair.key_pair_name
  key_pair_tag      = var.key_pair_tag
}

# Module for Auto Scaling Group
module "auto_scaling_group" {
  source               = "./modules/auto_scaling_group"
  lb_target_group_arn  = module.target_group.lb_target_group_arn
  autoscaling_name     = var.autoscaling_name
  launch_configuration = module.launch_configuration.launch_configuration
  public_subnet        = module.vpc.public_subnet
}

# Module for Load Balancer
module "load_balancer" {
  source              = "./modules/load_balancer"
  bucket              = module.s3-bucket.bucket
  public_subnet       = module.vpc.public_subnet
  private_subnet      = module.vpc.private_subnet
  load_balancer_name  = var.load_balancer_name
  lb_target_group_arn = module.target_group.lb_target_group_arn
  security_group_id   = module.security_group.security_group_id
  s3_bucket_arn       = module.s3-bucket.s3_bucket_arn
}

# module for target group
module "target_group" {
  source       = "./modules/target_group"
  vpc_id       = module.vpc.vpc_id
  target_group = var.target_group
}

module "rds" {
  source            = "./modules/RDS-database"
  public_subnet     = module.vpc.public_subnet
  private_subnet    = module.vpc.private_subnet
  security_group_id = module.security_group.security_group_id
  db_username       = var.db_username
  db_password       = var.db_password
}