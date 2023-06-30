# This module is used to create a NAT Gateway which is allowed to provide internet access to private instances

This module has a dependency on subnets modules 

Add the below variables in networking.tf 
```
module "ngw" {
    eip-name = var.nat-eip-name
    nat-gateway-name = var.ngw-name
    subnet-id = module.public-subnets.this_subnets_ids[0]
    env-name = var.env-name
    project = var.project 
}
```
Declare variables in variables.tf file
```
variable "ngw-name" {
    description = "Name of the NGW"
    type = string
}
variable "nat-eip-name" {
    description = "EIP name of the NAT"
    type = string
}
variable "project" {
  default = "test"
  type = string
}
variable "environment" {
  type = string
}
```
Provide values for variables in terraform.tfvars file
```
ngw-name = "vpc-ngw"
nat-eip-name = "nat-eip"
env-name = "test-research-development"
#change the environment names: dev, prod, staging, uat
project = "test-dev"
```
