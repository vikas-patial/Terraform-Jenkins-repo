# provider_region
variable "provider_region" {
  type = string
}

# infrastructure Configuration ami,region and instance_type
variable "instance_type" {
  type = string
}

variable "ami" {
  type = string
}

variable "region" {
  type = string
}

# access and secret key

variable "access_key" {
  type = string
}
variable "secret_key" {
  type = string
}

# for security group port

variable "port" {
  type = list(number)
}

# vpc name 
variable "vpc_name" {
  type = string
}

# taget group name 
variable "target_group" {
  type = string
}

# autoscalling name 
variable "autoscaling_name" {
  type = string
}

# load balancer
variable "load_balancer_name" {
  type = string
}

# security group name
variable "security_group_name" {
  type = string
}

# key-pair-name 
variable "key_pair_tag" {
  type = string
}

# variables for the key pair name and public key path
variable "key_pair_name" {
  type = string
}

variable "public_key_path" {
  description = "Path to the public key file"
  type        = string
}

# username & password for db_instance

variable "db_username" {
  type = string
}

variable "db_password" {
  type = string
}



