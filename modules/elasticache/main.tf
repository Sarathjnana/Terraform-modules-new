#security group
resource "aws_security_group" "redis" {
  name_prefix = var.cache-name
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = [var.vpc-cidr-block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# subnet_group
resource "aws_elasticache_subnet_group" "default" {
  name       = "${var.cache-name}-cache-subnet"
  subnet_ids = var.private_subnet_ids
}

# replication_group
resource "aws_elasticache_replication_group" "default" {
    
    replication_group_id          = var.cluster_id
    description = "Redis cluster for PaaS"

    node_type            = var.node_type
    num_node_groups      = var.node_groups
    replicas_per_node_group = 1
    automatic_failover_enabled = true

    port                 = 6379
    parameter_group_name = var.parameter_group_name

    snapshot_retention_limit = 5
    snapshot_window          = "00:00-05:00"

    subnet_group_name        = aws_elasticache_subnet_group.default.name

}
