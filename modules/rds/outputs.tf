output "db_address" {
  description = "The aws provided URL of the database"
  value       = aws_db_instance.this[*].address
}

output "db_instance_hosted_zone_id" {
  value = aws_db_instance.this[*].hosted_zone_id
}

output "db_instance_endpoint" {
  description = "The db adress and port for this RDS instance"
  value       = aws_db_instance.this[*].endpoint
}

output "db_security_group_id" {
  description = "The security group id for this RDS instance"
  value       = aws_security_group.this[*].id
}
