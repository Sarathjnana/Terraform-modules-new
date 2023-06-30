variable vpc-name {
  description = "Name of the VPC"
  type = string
}

variable vpc-cidr-block {
  description = "The CIDR block for the VPC"
  type = string
}
variable instance-tenancy {
  description = "A tenancy option for instances launched into the VPC"
  type = string
  default = "default"
}

variable "env-name" {
    description = "Map of common tags"
    type = string
}

variable "project" {
    description = "Name of the project or client"
    type = string
}

variable "default-tags" {
  type = map(string)
}

variable "enable_dns_hostnames" {
  type = bool
}

variable "enable_dns_support" {
  type = bool
}