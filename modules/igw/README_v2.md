# This module is used to create a internet gateway to VPC to access internet

This module has a dependency on VPC module

Add the below variables to networking.tf file
```
module "igw" {

    igw-name = var.igw-name
    vpc-id = module.vpc.this_id
    env-name = var.env-name
    project = var.project
}
```
Declare above variables in variables.tf file
```
variable "igw-name" {
    description = "Name of the IGW"
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
igw-name = "vpc-igw"
env-name = "test-research-development"
#change the environment names: dev, prod, staging, uat
project = "test-dev"
```
