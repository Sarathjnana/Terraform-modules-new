# This module is used to create a NAT Gateway which is allowed to provide internet access to private instances
```
module "ngw" {
    eip-name = var.nat-eip-name
    nat-gateway-name = var.ngw-name
    subnet-id = module.public-subnets.this_subnets_ids[0]
    env-name = var.env-name
    project = var.project 
}
```
Add this eip-name variable in the terraform.tfvars file to provide name for elastic ip <br/>
eip-name = var.nat-eip-name <br/>

Add this nat-gateway-name variable in the terraform.tfvars file to provide name for nat gateway <br/>
nat-gateway-name = var.ngw-name <br/>

To Add subnet-id variable we have TWO Scenarios. <br/>
Scenario-1: subnet already created and we are using that id pass it as variable like below. <br/>
subnet-id = var.public-subnets.this_subnets_ids[0] <br/>
Scenario-2: when subnets and ngw's are creating all at a time we will use like below. <br/>
subnet-id = module.public-subnets.this_subnets_ids[0] <br/>

Add this env-name variable in terraform.tfvars file to provide a environment name like dev,prod <br/>
env-name = var.env-name <br/>

Add this project variable in terraform.tfvars file to provide a project name <br/>
project = var.project <br/>