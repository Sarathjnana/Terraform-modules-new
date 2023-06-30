output "resource_bucket_id" {
  value = [for bucket in aws_s3_bucket.resource: bucket.id]
}
