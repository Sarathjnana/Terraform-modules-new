# This module is used to create public and private subnets

This module has a dependency on routetables module & we need to pass routetables i'd to create public or private subnets

Add the below variables in networking.tf file
```
module "private-subnets" {

    subnet-blocks = var.private-subnet-blocks
    vpc-id = module.vpc.this_id
    route-table-id = module.private-route-table.id
    env-name = var.env-name
    project = var.project
}
module "public-subnets" {

    subnet-blocks = var.public-subnet-blocks
    vpc-id = module.vpc.this_id
    route-table-id = module.public-route-table.id
    env-name = var.env-name
    project = var.project == null ? module.vpc.this_id : var.project
}

```
Declare the above variables in variables.tf file
```
#Subnets
variable "private-subnet-blocks" {
    description = "Pass Subnets - private"
    type = any 
}

variable "public-subnet-blocks" {
    description = "Pass Subnets - public"
    type = any 
}
variable "project" {
  default = "test"
  type = string
}

variable "environment" {
  type = string
  default = "dev"
}
```
Provide values to variables in terraform.tfvars file
```
env-name = "test-research-development"
#change the environment names: dev, prod, staging, uat
project = "test-dev"

private-subnet-blocks = {
    
    pri_subnet_1 = {
        cidr-block = "10.10.128.0/18"
        az = "ca-central-1a"
        subnet-name = "private-subnet-1"
    },
    pri_subnet_2 = {
        cidr-block = "10.10.192.0/18"
        az = "ca-central-1b"
        subnet-name = "private-subnet-2"
    }
}
public-subnet-blocks = {
    pub_subnet_1 = {
        cidr-block = "10.10.32.0/19"
        az = "ca-central-1a"
        subnet-name = "public-subnet-1"
        map-public-ip = true
    },
    pub_subnet_2 = {
        cidr-block = "10.10.64.0/19"
        az = "ca-central-1b"
        subnet-name = "public-subnet-2"
        map-public-ip = true
    }
}
```