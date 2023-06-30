variable "bucket_name" {
    description = "name of the s3 resource"
    type = string
}

variable "acl" {
    description = "acl"
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

variable "resource_buckets" {
  description = "Blocks of s3 buckets which are not websites"
  type = any
}
