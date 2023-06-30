#Common Tag
# aws --region <region> ssm get-parameters --names /aws/service/canonical/meta/publisher-id
#canonical_id = ["<canonical_id>"]

env-name = "test-tf-modules"
#change the environment names: dev, prod, staging, uat
#project = "test-dev"
#region = "ca-central-1"
default-tags = {
  owner      = "prem"
  created_by = "mani and sarath"
}
#acm_certificate_arn = "arn:aws:acm:ca-central-1:684878003660:certificate/5b345229-7c9b-4bb6-9f00-1e55458210c1"


#VPC and subnets
vpc-cidr             = "10.0.0.0/16"
vpc-name             = "vpc"
enable_dns_hostnames = true
enable_dns_support   = true
private-subnet-blocks = {
  pri_subnet_1 = {
    cidr-block  = "10.0.128.0/20"
    az          = "us-east-1a"
    subnet-name = "private-subnet-1"
  }
}
public-subnet-blocks = {
  pub_subnet_1 = {
    cidr-block    = "10.0.0.0/20"
    az            = "us-east-1a"
    subnet-name   = "public-subnet-1"
    map-public-ip = true
  }
}

# public-subnet-blocks = "10.10.32.0/19"

# private-subnet-blocks = "10.10.192.0/18"

# static resources storage in S3
resource_buckets = {
  jobarch = {
    bucket_name = "fivret-dev"
    acl         = "private"
  }
  #,
  # answers = {
  #     bucket_name = "answers-test-dev"
  #     acl = "public-read"
  # }
}

#IGW, NGW and EIP
igw-name     = "vpc-igw"
ngw-name     = "vpc-ngw"
nat-eip-name = "nat-eip"

#Routetables
private-rtb-name = "private-rtb"
public-rtb-name  = "public-rtb"

# Security Group Rules

# sg-name   = public
# sg-name-1 = private
# vpc-id    = module.vpc.this_id
# env-name = public-security
env-name-1 = private-security














# sg-rules = {
#   sg-rule-1 = {
#     rule-type         = "ingress"
#     from-port         = "443"
#     to-port           = "443"
#     rule-protocol     = "tcp"
#     source-cidr-block = "0.0.0.0/0"
#   },
#   sg-rule-2 = {
#     rule-type         = "ingress"
#     from-port         = "80"
#     to-port           = "80"
#     rule-protocol     = "tcp"
#     source-cidr-block = "0.0.0.0/0"
#   },
#   sg-rule-3 = {
#     rule-type         = "ingress"
#     from-port         = "22"
#     to-port           = "22"
#     rule-protocol     = "tcp"
#     source-cidr-block = "0.0.0.0/0"
#   }
#   sg-rule-4 = {
#     rule-type         = "ingress"
#     from-port         = 0
#     to-port           = 0
#     rule-protocol     = "-1"
#     source-cidr-block = "10.10.0.0/16"
#   }
#   sg-rule-5 = {
#     rule-type         = "egress"
#     from-port         = 0
#     to-port           = 0
#     rule-protocol     = "-1"
#     source-cidr-block = "0.0.0.0/0"
#   }
# }

# sg-rules-1 = {

#   sg-rule = {
#     rule-type         = "ingress"
#     from-port         = "22"
#     to-port           = "22"
#     rule-protocol     = "tcp"
#     source-cidr-block = "0.0.0.0/0"
#   }

#   sg-rule = {
#     rule-type         = "egress"
#     from-port         = 0
#     to-port           = 0
#     rule-protocol     = "-1"
#     source-cidr-block = "0.0.0.0/0"
#   }
# }


# # Elasticache Redis
# cache-name = "redis-dev"
# cluster_id = "redis-cluster"
# node_type = "cache.t3.micro"
# node_groups = 1
# parameter_group_name = "default.redis7.cluster.on"

# ## security group
# app-sg-name = "appserver-private"

# #EKS
eks-config = {
  eks-cluster-1 = {
    cluster-name = "dev-eks"
  }
}

nodegroup-config = {
  node-group-1 = {
    node_group_name = "dev-pool",
    instance_types  = ["m5a.large"],
    ami_type        = "AL2_x86_64"
    capacity_type   = "ON_DEMAND",
    disksize        = 100,
    keypair         = "k1",
    desiredsize     = 5,
    maxsize         = 7,
    minsize         = 5
  },
  node-group-2 = {
    node_group_name = "kafka-pool",
    instance_types  = ["t3a.small"],
    ami_type        = "AL2_x86_64"
    capacity_type   = "ON_DEMAND",
    disksize        = 100,
    keypair         = "k1",
    desiredsize     = 2,
    maxsize         = 3,
    minsize         = 2
  },
  node-group-3 = {
    node_group_name = "airflow-pool",
    instance_types  = ["m5a.large"],
    ami_type        = "AL2_x86_64"
    capacity_type   = "ON_DEMAND",
    disksize        = 100,
    keypair         = "k1",
    desiredsize     = 2,
    maxsize         = 3,
    minsize         = 2
  }
}

ekscluster-role-json                = "../dev/jsons/ekscluster-role.json"
eks-cluster-rolename                = "dev-eks-cluster-role"
cluster-log-types                   = ["api", "audit"]
eks-version                         = "1.22"
endpoint-private-access             = false
endpoint-public-access              = true
endpoint-public-access-cidrs        = ["0.0.0.0/0"]
workernode-role-json                = "../dev/jsons/workernode-role.json"
eks-workernode-rolename             = "dev-eks-worker-node-role"
eks-vpccni-name                     = "vpc-cni"
eks-kubeproxy-name                  = "kube-proxy"
eks-coredns-name                    = "coredns"
eks-workernode-albpolicy            = "../dev/jsons/workernode-albpolicy.json"
eks-eksworker-albpolicy             = "dev-eks-AWSLoadBalancerControllerIAMPolicy"
eks-workernode-alb-additionalpolicy = "../dev/jsons/workernode-albpolicy-additionalpolicy.json"
eks-cluster-autoscaler-policy       = "../dev/jsons/cluster-autoscaler-policy.json"
eks-eksworker-albpolicy2            = "dev-eks-AWSLoadBalancerControllerAdditionalIAMPolicy"
eks-vpccni-version                  = "v1.10.1-eksbuild.1"
eks-coredns-version                 = "v1.8.7-eksbuild.1"
eks-kubeproxy-version               = "v1.22.6-eksbuild.1"



# ec2 

instance_count = 1
server_name    = "test"
instance_type  = "t2.micro"
//subnet_id           	     = "subnet-08e5b58f019e15fb3"
key_name = "k1"
//vpc_security_group_ids 		 = ["sg-0c7bfdc1aa0c2cc87"]
associate_public_ip_address = false
volume_size                 = "8"
project                     = "test"


associate_public_ip_address-1 = true
