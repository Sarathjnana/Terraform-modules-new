resource "aws_vpc" "this" {
    cidr_block = var.vpc-cidr-block
    instance_tenancy = var.instance-tenancy
    enable_dns_hostnames = var.enable_dns_hostnames
    enable_dns_support = var.enable_dns_support

    tags = merge(
    var.default-tags,
    {
      Name        = var.project 
      Environment = var.env-name
    }
  )

}
