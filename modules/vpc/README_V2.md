# This module is used to create a VPC 

For this VPC module there is no dependencies from other resources we can directly create a VPC. 

Add the below variables in the networking.tf file 

```
module "vpc" {
    
    vpc-cidr-block = var.vpc-cidr  
    vpc-name = var.vpc-name 
    env-name = var.env-name 
    project = var.project == null ? var.vpc-name : var.project 
}

```
Declare the above in variables.tf file
```
# VPC
variable "vpc-cidr" {
    description = "vpc cidr"
    type = string  
}

variable "vpc-name" {
    description = "Name of the VPC"
    type = string  
}
variable "project" {
  default = "test"
  type = string
}

variable "env-name" {
  type = string
  default = "dev"
}
```
Provide the values for the variables declared in terraform.tfvars file

```
env-name = "test-research-development"
#change the environment names: dev, prod, staging, uat
project = "test-dev"
region = "ca-central-1"
#VPC
vpc-cidr = "10.10.0.0/16"
vpc-name = "vpc"
```
Note: Here in the module we have used a ternary operator to accept value if we haven't given value to variable project then var.vpc-name is assigned to project if we passed any value var.project is assigned to it.
