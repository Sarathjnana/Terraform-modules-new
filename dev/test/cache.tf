# module "skyhive-cache" {
#     source = "../../mono-infra/modules/elasticache/"

#     cache-name = var.cache-name
#     cluster_id = var.cluster_id
#     node_type = var.node_type
#     node_groups = var.node_groups
#     parameter_group_name = var.parameter_group_name
#     vpc_id = module.vpc.this_id
#     vpc-cidr-block = var.vpc-cidr
#     private_subnet_ids = module.private-subnets.this_subnets_ids

#   }