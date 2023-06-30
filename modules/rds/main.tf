resource "aws_db_instance" "this" {

  count = var.create_db_instance ? 1 : 0

  identifier                      = "${local.envname}-database"
  engine                          = var.engine
  engine_version                  = var.db_engine_version
  instance_class                  = var.db_instance_class
  allocated_storage               = var.allocated_storage
  db_name                            = var.db_name
  username                        = var.db_username
  password                        = var.db_password
  port                            = var.db_port
  publicly_accessible             = var.db_public_access
  vpc_security_group_ids          = [var.create_db_security_group ? aws_security_group.this[count.index].id : var.security_group_ids]
  db_subnet_group_name            = var.create_db_subnet_group ? aws_db_subnet_group.this[count.index].name : var.db_subnet_group
  parameter_group_name            = var.create_db_parameter_group ? aws_db_parameter_group.this[count.index].name : var.parameter_group
  allow_major_version_upgrade     = var.db_allow_major_engine_version_upgrade
  auto_minor_version_upgrade      = var.auto_minor_version_upgrade
  maintenance_window              = var.maintenance_window
  snapshot_identifier             = var.db_snapshot_migration
  copy_tags_to_snapshot           = var.copy_tags_to_snapshot
  skip_final_snapshot             = var.skip_final_snapshot
  backup_retention_period         = var.backup_retention_period
  backup_window                   = var.backup_window
  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports
  deletion_protection             = var.deletion_protection
  delete_automated_backups        = var.delete_automated_backups
  multi_az                = var.multi_az
  kms_key_id              = var.kms_key_id

  tags = merge(
    var.tags,
    {
      "Name" = local.envname
    },
  )
}

resource "aws_db_subnet_group" "this" {
  count = var.create_db_subnet_group ? 1 : 0

  name       = "${local.envname}-db-subnet-group"
  subnet_ids = var.db_subnet_ids

  tags = merge(
    var.tags,
    {
      "Name" = local.envname
    },
  )
}

resource "aws_security_group" "this" {
  count = var.create_db_security_group ? 1 : 0

  name        = "${local.envname}-db-sg"
  description = "Ingress and egress for ${local.envname} RDS"
  vpc_id      = var.vpc_id
  tags = merge(
    var.tags,
    {
      "Name" = local.envname
    },
  )

  ingress {
    description = "db ingress from vpc"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = [var.db_public_access ? "0.0.0.0/0" : var.vpc_cidr]
  }

  egress {
    description = "global egress"
    from_port   = 22
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_db_parameter_group" "this" {
  count = var.create_db_parameter_group ? 1 : 0

  name   = "${local.envname}-parameter-group"
  family = var.family

  dynamic "parameter" {
    for_each = var.parameters
    content {
      name         = parameter.value.name
      value        = parameter.value.value
      apply_method = lookup(parameter.value, "apply_method", null)
    }
  }

  tags = merge(
    var.tags,
    {
      "Name" = local.envname
    },
  )

  lifecycle {
    create_before_destroy = true
  }
}