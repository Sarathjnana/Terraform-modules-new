variable "cache-name" {
  description = "Default namespace"
}

variable "cluster_id" {
  description = "Id to assign the new cluster"
}

variable "node_groups" {
  description = "Number of nodes groups to create in the cluster"
  default     = 3
}

variable "node_type" {
  description = "Instance Type"
  default     = "cache.t3.micro"
}

variable "parameter_group_name" {
  description = "parameter_group_name with contains engine version too"
  default     = "default.redis7.cluster.on"
}

variable "private_subnet_ids" {
  description = "private_subnet_ids"
  type = list(string)
}

variable "vpc-cidr-block" {
  description = "vpc-cidr-block"
}

variable "vpc_id" {
  description = "vpc Id"
}
