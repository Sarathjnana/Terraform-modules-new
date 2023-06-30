resource "aws_cloudfront_origin_access_identity" "origin_access_identity" {
  comment = "Origin Access Identity for S3"
}

resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name = "${var.bucket_origin}"
    origin_id   = "${var.bucket_name}"

    s3_origin_config {
      origin_access_identity = "${aws_cloudfront_origin_access_identity.origin_access_identity.cloudfront_access_identity_path}"
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = "index.html"
  comment             = "${var.bucket_name}"

  
  aliases = "${var.alias_domains}"


  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "${var.bucket_name}"

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "allow-all"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  tags = {
    Name = "${var.cloudfront_distribution_name}"
    Environment = "${var.env-name}"
  }
  
  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }


  viewer_certificate {
       cloudfront_default_certificate = true
    #acm_certificate_arn = "${acm_certificate_arn}"
    #ssl_support_method  = "sni-only"
  }
}