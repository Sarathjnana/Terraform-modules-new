variable "env-name" {
    description = "Map of common tags"
    type = string
}

variable "subnet-blocks" {
  description = "Blocks of subnets wit attributes"
  type = any
}

variable "vpc-id" {
  description = "ID of the VPC"
  type        = string
}

variable "associate-route-table" {
  description = "Bool: associate subnets to route table"
  type = bool
  default = true
}

variable "route-table-id" {
  description = "route table to associate the subnets"
  type = string
  default = null
}

variable "project" {
    description = "Name of the project or client"
    type = string
}
# variable vpc_id {}

# variable publiccidr1 {}

# variable az1 {}

# variable privatecidr1 {}

# variable az2 {}