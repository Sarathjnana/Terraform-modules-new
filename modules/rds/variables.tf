// --------------------------
// General/Global Variables
// --------------------------
locals {
  envname = "${var.application}-${var.environment}"
}

variable "application" {
  type        = string
  description = "The overall name of the shared resources"
}

variable "environment" {
  type        = string
  description = "a short name describing the lifecyle or stage of development that this is running for; ex: 'dev', 'qa', 'prod', 'test'"
}

variable "tags" {
  default = { terraform_managed = "true" }
  type    = map(any)
}

// --------------------------
// Database Variables
// --------------------------
variable "create_db_instance" {
  type    = bool
  default = true
}

variable "engine" {
  type        = string
  description = "The name of the default postgress engine"
}

variable "db_engine_version" {
  description = "the database major and minor version of postgres"
  default     = "13.1"
}

variable "db_instance_class" {
  description = "The instance type of the db"
  default     = "db.t3.small"
}

variable "allocated_storage" {
  type        = number
  description = "DB allocated_storage "
  default     = 100
}

variable "db_name" {
  type        = string
  description = "The name of the default Database to be created"
}

variable "db_username" {
  type        = string
  description = "The name of the default postgres user created by RDS when the instance is booted"
}

variable "db_password" {
  type        = string
  description = "The postgres database password created for the default database when the instance is booted"
}

variable "db_port" {
  type        = number
  description = "database port"
  default     = 5432
}

variable "db_public_access" {
  description = "Bool to control if instance is publicly accessible"
  type        = bool
  default     = false
}

variable "security_group_ids" {
  type    = string
  default = ""
}

variable "db_subnet_group" {
  type        = string
  default     = null
}

variable "parameter_group" {
  type        = string
  default     = null
}

variable "db_major_version" {
  default = "13"
}

variable "db_allow_major_engine_version_upgrade" {
  default = false
}

variable "auto_minor_version_upgrade" {
  default = false
}

variable "maintenance_window" {
  description = "The window to perform maintenance in. Syntax: 'ddd:hh24:mi-ddd:hh24:mi'. Eg: 'Mon:00:00-Mon:03:00'"
  type        = string
  default     = null
}

// --------------------------
// Migration Variables
// --------------------------
variable "db_snapshot_migration" {
  type        = string
  description = "Name of snapshot that will used to for new database, needs to in the same region"
  default     = ""
}

variable "copy_tags_to_snapshot" {
  default = false
}

variable "skip_final_snapshot" {
  default = true
}

variable "backup_retention_period" {
  description = "The days to retain backups for"
  type        = number
  default     = null
}

variable "backup_window" {
  description = "The daily time range (in UTC) during which automated backups are created if they are enabled. Example: '09:46-10:16'. Must not overlap with maintenance_window"
  type        = string
  default     = null
}

variable "enabled_cloudwatch_logs_exports" {
  description = "List of log types to enable for exporting to CloudWatch logs. If omitted, no logs will be exported. Valid values (depending on engine): alert, audit, error, general, listener, slowquery, trace, postgresql (PostgreSQL), upgrade (PostgreSQL)."
  type        = list(string)
  default     = []
}

variable "deletion_protection" {
  description = "The database can't be deleted when this value is set to true."
  type        = bool
  default     = false
}

variable "delete_automated_backups" {
  description = "Specifies whether to remove automated backups immediately after the DB instance is deleted"
  type        = bool
  default     = false
}

// --------------------------
// aws_db_subnet_group Variables
// --------------------------

variable "create_db_subnet_group" {
  type    = bool
  default = false
}

variable "db_subnet_ids" {
  description = "A list of VPC subnet IDs"
  type        = list(string)
  default     = []
}

// --------------------------
// aws_security_group Variables
// --------------------------

variable "create_db_security_group" {
  type    = bool
  default = false
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}


variable "vpc_cidr" {
  type        = string
  description = "VPC cidr block"
}

// --------------------------
// aws_db_parameter_group Variables
// --------------------------

variable "create_db_parameter_group" {
  type    = bool
  default = false
}

variable "family" {
  description = "The family of the DB parameter group"
  type        = string
  default     = null
}

variable "parameters" {
  description = "A list of DB parameter maps to apply"
  type        = list(map(string))
  default     = []
}

variable "create_before_destroy" {
  type    = bool
  default = true
}


variable "multi_az" {
  default = false
}

variable "kms_key_id" {
  default = ""
}