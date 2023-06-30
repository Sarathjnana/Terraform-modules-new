# ubuntu versions
variable "name_map" {
  default = {
    "22.04" = "jammy"
    "20.04" = "focal"
    "18.04" = "bionic"
    "17.10" = "artful"
    "17.04" = "zesty"
    "16.04" = "xenial"
    "14.04" = "trusty"
  }
  description = "map of release numbers to names"
  type        = map(string)
}

variable "key_name" {
  type = string 
}

variable "ami" {
  type = string
  default = null
}

variable "instance_type" {
  type = string
  default = "t3.mirco"
}

variable "server_name" {
	type = string
}

variable "volume_size" {
  type = number
}

variable "project" {
  type = string
}

#variable "canonical_id" {
#  type = list(string)
#}

variable "vpc_security_group_ids" {
  type = list(string) 
}

variable "instance_count" {
  type = number
  default = 1
}

variable "release" {
  type = string
  default = "22.04"
}

variable "subnet_id" {
  type = string
}

variable associate_public_ip_address {
  type = bool
  default = false
}

