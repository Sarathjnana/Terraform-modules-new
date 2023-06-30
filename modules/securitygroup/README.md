# This module is used to create security groups and is referred in security-group.tf
```
module "eks-sg" {
    sg-name = "eks-eg"
    vpc-id = module.vpc.this_id
    env-name = var.env-name
    sg-rules = var.sg-rules
}
```
Here sg-name we have declared with value by default. We can declare them with variables also.

Example like, sg-name = var.sg-name <br/>

To Add vpc-id variables we have TWO Scenarios. <br/>
Scenario-1: VPC already created and we are using that id pass it as variable like below. <br/>
vpc-id = var.vpc-id <br/>
Scenario-2: when subnets and vpc are creating all at a time we will use like below. <br/>
vpc-id = module.vpc.this_id <br/>

Add this env-name variable in terraform.tfvars file to provide a environment name like dev,prod <br/>
env-name = var.env-name <br/>

Add the  sg-rules variable in terraform.tfvars file to pass security group rules <br/>
sg-rules = var.sg-rules <br/>
Example like below, <br/>

```
sg-rules = {
    sg-rule-1 = {
        rule-type = "ingress"
        from-port = "443"
        to-port = "443"
        rule-protocol = "tcp"
        source-cidr-block = "0.0.0.0/0"
    },

sg-rule-5 = {
        rule-type = "egress"
        from-port = 0
        to-port = 0
        rule-protocol = "-1"
        source-cidr-block = "0.0.0.0/0"
    }
}
```