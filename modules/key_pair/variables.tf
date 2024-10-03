# key-pair-name 

variable "key_pair_tag" {
    type = string
}
 

variable "key_pair_name" {
  description = "Name of the key pair to create"
  type        = string
}

variable "public_key_path" {
  description = "Path to the public key file"
  type        = string
}
