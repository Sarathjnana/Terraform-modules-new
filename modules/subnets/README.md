# This module is used to create subnets and is referred in networking.tf file 

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
Add the subnet-blocks variable for creating private subnet blocks in terraform.tfvars <br/>
subnet-blocks = var.private-subnet-blocks <br/>
Add the subnet-blocks variable for creating public subnet blocks in terraform.tfvars <br/>
subnet-blocks = var.public-subnet-blocks <br/>

To Add vpc-id variables we have TWO Scenarios. <br/>
Scenario-1: VPC already created and we are using that id pass it as variable like below. <br/>
vpc-id = var.vpc-id <br/>
Scenario-2: when subnets and vpc are creating all at a time we will use like below. <br/>
vpc-id = module.vpc.this_id <br/>

To Add route-table-id variables we have TWO Scenarios. <br/>
Scenario-1: Route TAble id already created and we are using that id pass it as variable like below. <br/>
vpc-id = var.private-route-table-id (or) var.public-route-table-id <br/>
Scenario-2: when subnets and vpc are creating all at a time we will use like below. <br/>
vpc-id = module.private-route-table.id (or) module.public-route-table.id <br/>

Add this env-name variable in terraform.tfvars file to provide a environment name like dev,prod <br/>
env-name = var.env-name <br/>

Add this project variable in terraform.tfvars file to provide a project name <br/>
project = var.project == null ? var.vpc-name : var.project <br/>