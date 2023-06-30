# this module is more related to Static Website Hosting
#
resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
  acl = var.acl
  policy = templatefile("templates/s3-policy.json", { bucket = "${var.bucket_name}" })

  cors_rule {
    allowed_headers = ["Authorization", "Content-Length"]
    allowed_methods = ["GET", "POST"]
    allowed_origins = ["*"]
    max_age_seconds = 3000
  }

  website {
    index_document = "index.html"
    error_document = "404.html"
  }

  tags = {
    Name        = "${var.bucket_name}"
    Environment = "${var.env-name}"
    Project     = "${var.project}"
  }

}
