# To make use of this 
module "db" {
  source = "../rds/"

  application = "demo"
  environment = "dev"

  engine            = "postgres"
  db_engine_version = "14.1"
  db_instance_class = "db.m5.large"
  allocated_storage = 100

  db_name     = "demodb"
  db_username = "postgresuser"
  db_password = "XXXXXXXXXX"
  db_port     = "3306"
  multi_az    = true

  auto_minor_version_upgrade = true
  maintenance_window         = "Mon:00:00-Mon:03:00"

  copy_tags_to_snapshot   = true
  skip_final_snapshot     = true
  backup_retention_period = 30
  backup_window           = "03:00-06:00"

  tags = {
    Owner       = "JOHN"
    Environment = "dev"
  }

To create DB subnet Group add below variables
  create_db_subnet_group = true
  db_subnet_ids          = ["subnet-ID1", "subnet-ID1"]

Not to create DB subnet Group add below variables
  create_db_subnet_group = false
  db_subnet_group        = "name of the DB subnet Group name"


To Create aws_security_group make use of below variables
  create_db_security_group = true
  vpc_id                   = "vpc-ID"
  vpc_cidr                 = "VPC-CIDR"

Not to Create aws_security_group make use of below variables
  create_db_security_group = false
  security_group_ids = "Enter the DB Security Grouop ID's"


TO create aws_db_parameter_group make use of below varibales
  create_db_parameter_group = true
  family                    = "postgres14"

Not tO create aws_db_parameter_group make use of below varibales
  create_db_parameter_group = false
  parameter_group           = "name of the DB parameter Group name"

}