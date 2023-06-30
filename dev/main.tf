# ec2

# module "appserver_a" {
#     source = "../../mono-infra/modules/ec2"

#   instance_count              = var.instance_count
#   server_name                 = var.server_name
#   instance_type               = var.instance_type
#   subnet_id                   = var.subnet_id
#   key_name                    = var.key_name
#   vpc_security_group_ids      = var.vpc_security_group_ids
#   associate_public_ip_address = var.associate_public_ip_address
#   volume_size                 = var.volume_size
#   project                     = var.project

# }

module "vpc" {
  source = "/home/fission/Downloads/mono-infra-bkp/modules/vpc/"

  vpc-cidr-block       = var.vpc-cidr
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  default-tags         = var.default-tags
  vpc-name             = var.vpc-name
  env-name             = var.env-name
  project              = var.project
}

module "private-subnets" {
  source         = "/home/fission/Downloads/mono-infra-bkp/modules/subnets/"
  subnet-blocks  = var.private-subnet-blocks
  vpc-id         = module.vpc.this_id
  route-table-id = module.private-route-table.id
  env-name       = var.env-name
  project        = var.project
}

module "public-subnets" {
  source         = "/home/fission/Downloads/mono-infra-bkp/modules/subnets/"
  subnet-blocks  = var.public-subnet-blocks
  vpc-id         = module.vpc.this_id
  route-table-id = module.public-route-table.id
  env-name       = var.env-name
  project        = var.project
}

module "igw" {
  source   = "/home/fission/Downloads/mono-infra-bkp/modules/igw/"
  igw-name = var.igw-name
  vpc-id   = module.vpc.this_id
  env-name = var.env-name
  project  = var.project
}

module "ngw" {
  source           = "/home/fission/Downloads/mono-infra-bkp/modules/nat/"
  eip-name         = var.nat-eip-name
  nat-gateway-name = var.ngw-name
  subnet-id        = module.public-subnets.this_subnets_ids[0]
  env-name         = var.env-name
  project          = var.project
}

module "public-route-table" {
  source   = "/home/fission/Downloads/mono-infra-bkp/modules/routetables/"
  vpc-id   = module.vpc.this_id
  gw-id    = module.igw.igw_id
  rtb-name = var.public-rtb-name
  env-name = var.env-name
  project  = var.project
}

module "private-route-table" {
  source   = "/home/fission/Downloads/mono-infra-bkp/modules/routetables/"
  vpc-id   = module.vpc.this_id
  gw-id    = module.ngw.nat_gateway_id
  rtb-name = var.private-rtb-name
  env-name = var.env-name
  project  = var.project
  # default-tags  = var.default-tags
  # enable_dns_hostnames = var.enable_dns_hostnames
  # enable_dns_support = var.enable_dns_support
}

# # ec2

module "appserver_a" {
  source = "/home/fission/Downloads/mono-infra-bkp/modules/ec2"

  count                  = var.instance_count
  server_name            = var.server_name
  instance_type          = var.instance_type
  subnet_id              = module.private-subnets.this_subnets_ids[0]
  key_name               = var.key_name
  vpc_security_group_ids = ["${module.security-group.this-1_id}"]
  //vpc_security_group_ids      = var.vpc_security_group_ids
  associate_public_ip_address = var.associate_public_ip_address
  volume_size                 = var.volume_size
  project                     = var.project
  //canonical_id                = var.canonical_id
}

module "bastion_a" {
  source = "/home/fission/Downloads/mono-infra-bkp/modules/ec2"

  count                  = var.instance_count
  server_name            = var.server_name
  instance_type          = var.instance_type
  subnet_id              = module.public-subnets.this_subnets_ids[0]
  key_name               = var.key_name
  vpc_security_group_ids = ["${module.security-group.this_id}"]
  //vpc_security_group_ids      = var.vpc_security_group_ids
  associate_public_ip_address = var.associate_public_ip_address-1
  volume_size                 = var.volume_size
  project                     = var.project
  //canonical_id                = var.canonical_id
}



# this module is for s3 bucket for files storagedata 

# module "s3resource" {
#   source           = "/home/fission/Downloads/mono-infra-bkp/modules/s3_resource/"
#   resource_buckets = var.resource_buckets
#   bucket_name      = var.bucket_name
#   acl              = var.acl
#   env-name         = var.env-name
#   project          = var.project
# }

module "security-group" {
  source = "/home/fission/Downloads/mono-infra-bkp/modules/securitygroup/"

#   sg-name  = var.sg-name
  vpc-id   = module.vpc.this_id
#   env-name = var.env-name

}

