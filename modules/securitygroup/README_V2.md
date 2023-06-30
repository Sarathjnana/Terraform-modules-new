# This module is used to create security groups 

This module has a dependency on VPC module and need VPC i'd to create security group

Add the below variables in networking.tf file
```
module "eks-sg" {
    sg-name = "eks-eg"
    vpc-id = module.vpc.this_id
    env-name = var.env-name
    sg-rules = var.sg-rules
}
```
Declare the above variables in variables.tf file
```
variable "sg-rules" {
    description = "Security Group Rules"
    type = any
}
variable "environment" {
  type = string
}
```
Provide values to variables in terraform.tfvars file
```
env-name = "test-research-development"
sg-rules = {
    sg-rule-1 = {
        rule-type = "ingress"
        from-port = "443"
        to-port = "443"
        rule-protocol = "tcp"
        source-cidr-block = "0.0.0.0/0"
    },

sg-rule-2 = {
        rule-type = "egress"
        from-port = 0
        to-port = 0
        rule-protocol = "-1"
        source-cidr-block = "0.0.0.0/0"
    }
}
```
