# Iterate the resource_buckets block and create the buckets
resource "aws_s3_bucket" "resource" {
  for_each = var.resource_buckets

  bucket = lookup(each.value, "bucket_name", null)
  acl = lookup(each.value, "acl", null)
  policy = templatefile("${path.module}/s3-policy.json", { bucket = lookup(each.value, "bucket_name", null) })

  tags = {
    Name        = lookup(each.value, "bucket_name", null)
    Environment = var.env-name
    Project     = var.project
  }

}
