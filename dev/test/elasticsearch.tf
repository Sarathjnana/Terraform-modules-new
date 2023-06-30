
# data "aws_region" "current" {}

# resource "aws_elasticsearch_domain" "this" {
#     domain_name = var.domain
#     elasticsearch_version = "7.10"

#     domain_endpoint_options {
#       enforce_https = true
#       tls_security_policy = "Policy-Min-TLS-1-2-2019-07"
#     }

#     cluster_config {
#       instance_type = "t3.medium.elasticsearch"
#       instance_count = 2
#       zone_awareness_enabled = true
#     }

#     ebs_options {
#       ebs_enabled = true
#       volume_size = 50
#     }

#     auto_tune_options {
#       desired_state = "ENABLED"
#       rollback_on_disable = "NO_ROLLBACK"
#     }

#     advanced_security_options {
#       enabled = true
#       internal_user_database_enabled = true
#       master_user_options {
#         master_user_name = "master"
#         master_user_password = "C7qcfufj@rGCQxupd"
#       }
#     }

#     encrypt_at_rest {
#       enabled = true
#     }
#     node_to_node_encryption {
#       enabled = true
#     }

#     access_policies = <<POLICY
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Action": "es:*",
#       "Principal": "*",
#       "Effect": "Allow",
#       "Resource": "arn:aws:es:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:domain/${var.domain}/*"
#     }
#   ]
# }
# POLICY
  
# }
