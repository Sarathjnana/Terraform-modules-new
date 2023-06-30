# This module is used to create a VPC and is referred in networking.tf file
```
module "vpc" {
    
    vpc-cidr-block = var.vpc-cidr  
    vpc-name = var.vpc-name 
    env-name = var.env-name 
    project = var.project == null ? var.vpc-name : var.project 
}

```
Add this variable vpc-cidr in the terraform.tf.vars to create a VPC with given CIDR. <br/>
vpc-cidr-block = var.vpc-cidr <br/>

Add this vpc-name in terraform.tfvars file to create a VPC with that name <br/>
vpc-name = var.vpc-name <br/>

Add this env-name variable in terraform.tfvars file to provide a environment name like dev,prod <br/>
env-name = var.env-name <br/>

Add this project variable in terraform.tfvars file to provide a project name <br/>
project = var.project == null ? var.vpc-name : var.project <br/>

Note: Here in the module we have used a ternary operator to accept value if we haven't given value to variable project then var.vpc-name is assigned to project if we passed any value var.project is assigned to it.