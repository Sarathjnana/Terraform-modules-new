

# VPC
variable "vpc-cidr" {
  description = "vpc cidr"
  type        = string
}

variable "vpc-name" {
  description = "Name of the VPC"
  type        = string
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

# variable "private-subnet-blocks" {}

# variable "public-subnet-blocks" {}
#Subnets
variable "private-subnet-blocks" {
  description = "PaasS Subnets - private"
  type        = any
}

variable "public-subnet-blocks" {
  description = "PaasS Subnets - public"
  type        = any
}

#IGW
variable "igw-name" {
  description = "Name of the IGW"
  type        = string
}

#NGW
variable "ngw-name" {
  description = "Name of the NGW"
  type        = string
}

variable "nat-eip-name" {
  description = "EIP name of the NAT"
  type        = string
}

#Route tables
variable "public-rtb-name" {
  description = "Name of the public route table"
  type        = string
}

variable "private-rtb-name" {
  description = "Name of the private route table"
  type        = string
}

variable "env-name" {
  description = "environment name"
  type        = string
}

#Security Group

# variable "sg-name" {
#   description = "Name of the Security Group"
#   type        = string
# }

# variable "sg-name-1" {
#   description = "Name of the Security Group"
#   type        = string
# }

# variable "vpc-id" {
#   description = "ID of the VPC"
#   type        = string
# }

# variable "env-name" {
#     description = "Common Tag"
#     type = string  
# }



# variable "sg-rules" {
#   description = "Security Group Rules"
#   type        = any
# }


# variable "sg-rules-1" {
#   description = "Security Group Rules"
#   type        = any
# }

# variable "app-sg-name" {
#   description = "Security Group Name app private"
#   type        = any
# }

###EKS
variable "ekscluster-role-json" {
  description = "path of the ekscluster role"
}

variable "eks-cluster-rolename" {
  description = "name of the cluster rolename"
  type        = string
}

variable "eks-config" {
  description = "Configuration of the EKS Cluster"
  type        = any
}


variable "cluster-log-types" {
  description = "cluster log type"
}

variable "eks-version" {
  description = "eks cluster version"
}

variable "endpoint-private-access" {
  description = "private access for the eks"
  type        = bool
}

variable "endpoint-public-access" {
  description = "endpoint for the public access"
  type        = bool
}

variable "endpoint-public-access-cidrs" {
  description = "ip address for the endpoint public to access"
}

variable "workernode-role-json" {
  description = "path of the workernode role"
}

variable "eks-workernode-rolename" {
  description = "name for the workernode role"
  type        = string
}

variable "eks-vpccni-name" {
  description = "name of the vpccni"
  type        = string
}

variable "eks-coredns-name" {
  description = "name of the vpccni"
  type        = string
}

variable "eks-kubeproxy-name" {
  description = "name of the vpccni"
  type        = string
}

variable "eks-workernode-albpolicy" {
  description = "Name of the json file"
}

variable "nodegroup-config" {}

variable "eks-cluster-autoscaler-policy" {
  description = "Name of the json file"
}

variable "eks-workernode-alb-additionalpolicy" {
  description = "Name of the json file"
}

variable "eks-eksworker-albpolicy2" {
  description = "Name of the alb policy that will attach to the worker nodes"
  type        = string
}
variable "eks-eksworker-albpolicy" {
  description = "Name of the alb policy that will attach to the worker nodes"
  type        = string
}

variable "tags" {
  description = "Map of tags"
  type        = map(string)
  default     = null
}

variable "eks-vpccni-version" {
  description = "version number for vpccni"
}

variable "eks-coredns-version" {
  description = "version number for coredns"
}

variable "eks-kubeproxy-version" {
  description = "version number for kubeproxy"
}

# elasticsearch domain
# variable "domain" {
#   description = "name of the elastic search domain"
# }

variable "project" {
  default = "test"
  type    = string
}

variable "environment" {
  type    = string
  default = "dev"
}

#variable "canonical_id" {
#  type        = list
#}



#------- temporary 
# variable "aws_profile" {
#   type    = string
#   default = "fission"
# }

variable "aws_region" {
  type    = string
  default = "ca-central-1"
}

# variable "creds_loc" {
#   type    = string
#   default = "~/.aws/credentials"
# }


# s3 resources
variable "acl" {
  default = "private"
  type    = string
}

variable "bucket_name" {
  description = "name of the s3 resource"
  type        = string
  default     = null
}

variable "resource_buckets" {
  description = "Blocks of s3 buckets which are not websites"
  type        = any
  default     = null
}

# ElastiCache

# variable "cache-name" {}
# variable "cluster_id" {}
# variable "node_type" {}
# variable "node_groups" {}
# variable "parameter_group_name" {}


#ec2

variable "key_name" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "server_name" {
  type = string
}

variable "instance_count" {
  type = number
}

variable "volume_size" {
  type = number
}

#variable "project" {
#  type = string
#}

# variable "vpc_security_group_ids" {
#   type = list(string)
# }

# //variable "subnet_id" {
#   type = string
# }

variable "associate_public_ip_address" {
  type    = bool
  default = true
}

variable "associate_public_ip_address-1" {
  type    = bool
  default = true
}