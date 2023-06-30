# This module is used to create route tables in VPC

This module has a dependency on VPC & IGW modules 

Add the below variables in networking.tf file
```
module "public-route-table" {

    vpc-id = module.vpc.this_id
    gw-id = module.igw.igw_id
    rtb-name = var.public-rtb-name
    env-name = var.env-name
    project = var.project
}

module "private-route-table" {

    vpc-id = module.vpc.this_id
    gw-id = module.ngw.nat_gateway_id
    rtb-name = var.private-rtb-name
    env-name = var.env-name
    project = var.project
}
```
Declare the above variables in variables.tf file
```
variable "public-rtb-name" {
    description = "Name of the public route table"
    type = string  
}
variable "private-rtb-name" {
    description = "Name of the private route table"
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
private-rtb-name = "private-rtb"
public-rtb-name = "public-rtb"
env-name = "test-research-development"
#change the environment names: dev, prod, staging, uat
project = "test-dev"
```

