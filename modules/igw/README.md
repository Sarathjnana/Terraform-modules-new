# This module is used to create a internet gateway to VPC to access internet. 
```
module "igw" {

    igw-name = var.igw-name
    vpc-id = module.vpc.this_id
    env-name = var.env-name
    project = var.project
}
```
Add this igw-name variable in the terraform.tfvars file to provide name for internet gateway <br/>
igw-name = var.igw-name <br/>

To Add vpc-id variables we have TWO Scenarios. <br/>
Scenario-1: VPC already created and we are using that id pass it as variable like below. <br/>
vpc-id = var.vpc-id <br/>
Scenario-2: when subnets and vpc are creating all at a time we will use like below. <br/>
vpc-id = module.vpc.this_id <br/>

Add this env-name variable in terraform.tfvars file to provide a environment name like dev,prod <br/>
env-name = var.env-name <br/>

Add this project variable in terraform.tfvars file to provide a project name <br/>
project = var.project <br/>