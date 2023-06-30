# This module is used to create route tables in VPC and is referred in networking.tf file
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
To Add vpc-id variables we have TWO Scenarios. <br/>
Scenario-1: VPC already created and we are using that id pass it as variable like below. <br/>
vpc-id = var.vpc-id <br/>
Scenario-2: when subnets and vpc are creating all at a time we will use like below. <br/>
vpc-id = module.vpc.this_id <br/>

To Add gw-id variable we have TWO Scenarios  <br/>
Scenario-1: igw_id already created and we are using that id pass it as variable like below. <br/>
gw-id = var.igw_id <br/>
Scenario-2: when igw and route tables are creating all at a time we will use like below. <br/>
gw-id = module.igw.igw_id <br/>

To Add gw-id variable we have TWO Scenarios  <br/>
Scenario-1: nat_id already created and we are using that id pass it as variable like below. <br/>
gw-id = var.nat_id <br/>
Scenario-2: when igw and route tables are creating all at a time we will use like below. <br/>
gw-id = module.ngw.nat_gateway_id <br/>

Add this rtb-name variable in terraform.tfvars file to provide <br/>
rtb-name = var.public-rtb-name
rtb-name = var.private-rtb-name

Add this env-name variable in terraform.tfvars file to provide a environment name like dev,prod <br/>
env-name = var.env-name <br/>

Add this project variable in terraform.tfvars file to provide a project name <br/>
project = var.project <br/>