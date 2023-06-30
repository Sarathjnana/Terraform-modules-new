variable "ekscluster-role-json" {
  description = "path of the ekscluster role"
}

variable "eks-cluster-rolename" {
  description = "name of the cluster rolename"
  type        = string
}

variable "eks-config" {
  description = "config of the EKS cluster"
  type = any
}

variable "cluster-log-types" {
  description = "cluster log type"
}

variable "eks-version" {
  description = "eks cluster version"
}

variable "endpoint-private-access" {
  description = "private access endpoint"
  type        = bool
}

variable "endpoint-public-access" {
  description = "public access endpoint"
  type        = bool
}

variable "endpoint-public-access-cidrs" {
  description = "ip address for public to access endpoint"
}

variable "eks-security-group" {
  description = "security group for the eks cluster"
}

variable "eks-subnets" {
  description = "subnets for assinging to the eks"
}

variable "eks-node-subnets" {
  description = "subnets for the node group"
}

variable "workernode-role-json" {
  description = "path of the workernode role"
}

variable "eks-workernode-rolename" {
  description = "name for the workernode role"
  type        = string
}

variable "eks-instancetypes" {
  description = "instance type for the eks"
}

variable "eks-amitype" {
  description = "ami name for the eks worker nodes"
}

variable "eks-capacitytype" {
  description = "worker nodes on demand or spot instances"
}

variable "eks-disksize" {
  description = "size of disk to be attached to instances"
  type        = number
}

variable "eks-keypair" {
  description = "worker node access keypair"
}

variable "eks-desiredsize" {
  description = "instances to be spin up in number"
  type        = number
}

variable "eks-maxsize" {
  description = "instances to be spin up in number"
  type        = number
}

variable "eks-minsize" {
  description = "instances to be spin up in number"
  type        = number
}

variable "vpccni-name" {
  description = "name of the vpccni"
  type        = string
}

variable "coredns-name" {
  description = "name of the vpccni"
  type        = string
}

variable "kubeproxy-name" {
  description = "name of the vpccni"
  type        = string
}


variable "workernode-albpolicy" {
  description = "Name of the json file"
}

variable "eksworker-albpolicy" {
  description = "Name of the alb policy that will attach to the worker nodes"
}

variable "workernode-alb-additionalpolicy" {
  description = "Name of the json file"
}

variable "eksworker-albpolicy2" {
  description = "Name of the alb policy that will attach to the worker nodes"
}

variable "eks-cluster-autoscaler-policy" {
  description = "Name of the eks cluster autoscaler role"
}

variable "vpccni-version" {
  description = "version number for vpccni"
}

variable "coredns-version" {
  description = "version number for coredns"
}

variable "kubeproxy-version" {
  description = "version number for kubeproxy"
}

variable "env-name" {
    description = "Map of common tags"
    type = string
}

variable "eks-cluster-exists" {
  description = "Bool to check if cluster exists"
  type = bool
  default = true

}
variable "enable_irsa" {
  description = "Determines whether to create an OpenID Connect Provider for EKS to enable IRSA"
  type        = bool
  default     = true
}

variable "create" {
  description = "Controls if EKS resources should be created (affects nearly all resources)"
  type        = bool
  default     = true
}
