# this module is for s3 bucket for files storagedata 

module "s3resource" {
    source = "../../mono-infra/modules/s3_resource/"
    resource_buckets = var.resource_buckets
    bucket_name = var.bucket_name
    acl = var.acl
    env-name = var.env-name
    project = var.project
}
