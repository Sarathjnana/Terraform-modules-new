module "vpc" {
    source = "../../mono-infra/modules/vpc/"

    vpc-cidr-block = var.vpc-cidr
    vpc-name = var.vpc-name
    env-name = var.env-name
    project = var.project == null ? var.vpc-name : var.project
}

module "private-subnets" {
    source = "../../mono-infra/modules/subnets/"
    subnet-blocks = var.private-subnet-blocks
    vpc-id = module.vpc.this_id
    route-table-id = module.private-route-table.id
    env-name = var.env-name
    project = var.project
}

module "public-subnets" {
    source = "../../mono-infra/modules/subnets/"
    subnet-blocks = var.public-subnet-blocks
    vpc-id = module.vpc.this_id
    route-table-id = module.public-route-table.id
    env-name = var.env-name
    project = var.project == null ? module.vpc.this_id : var.project
}

module "igw" {
    source = "../../mono-infra/modules/igw/"
    igw-name = var.igw-name
    vpc-id = module.vpc.this_id
    env-name = var.env-name
    project = var.project
}

module "ngw" {
    source = "../../mono-infra/modules/nat/"
    eip-name = var.nat-eip-name
    nat-gateway-name = var.ngw-name
    subnet-id = module.public-subnets.this_subnets_ids[0]
    env-name = var.env-name
    project = var.project 
}

module "public-route-table" {
    source = "../../mono-infra/modules/routetables/"
    vpc-id = module.vpc.this_id
    gw-id = module.igw.igw_id
    rtb-name = var.public-rtb-name
    env-name = var.env-name
    project = var.project
}

module "private-route-table" {
    source = "../../mono-infra/modules/routetables/"
    vpc-id = module.vpc.this_id
    gw-id = module.ngw.nat_gateway_id
    rtb-name = var.private-rtb-name
    env-name = var.env-name
    project = var.project
    default-tags  = var.default-tags
    enable_dns_hostnames = var.enable_dns_hostnames
    enable_dns_support = var.enable_dns_support
}

# # ec2

# module "appserver_a" {
#     source = "../../mono-infra/modules/ec2"
    
#     count                       = var.instance_count
#     server_name                 = var.server_name
#     instance_type               = var.instance_type
#     subnet_id                   = module.private-subnets.this_subnets_ids[0]
#     key_name                    = var.key_name
#     vpc_security_group_ids      = ["${module.appserver-sg.sg-id}"]
#     associate_public_ip_address = var.associate_public_ip_address
#     volume_size                 = var.volume_size

#     project                     = var.project
#     canonical_id                = var.canonical_id
# }



