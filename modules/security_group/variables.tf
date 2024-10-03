# security group name

variable "security_group_name" {
   type = string
}

variable "port" {
  type = list(number)
}

variable "vpc_id" {
      type    = string
}


