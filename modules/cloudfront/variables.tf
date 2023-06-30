variable "alias_domains" {
    description = "domain aliases"
    type = list(string)
}

variable "cloudfront_distribution_name" {
    description = "cloudfront_distribution_name"
    type = string
}

variable "bucket_origin" {
    description = "bucket_origin"
    type = string
}

variable "bucket_name" {
    description = "bucket_origin"
    type = string
}


variable "env-name" {
    description = "Map of common tags"
    type = string
}

variable "project" {
    description = "Name of the project or client"
    type = string
}
