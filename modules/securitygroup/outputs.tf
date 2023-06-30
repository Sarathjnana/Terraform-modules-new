output "this_id" {
    description = "ID of security group"
    value = aws_security_group.this.id
}

output "this-1_id" {
    description = "second security group id"
    value = aws_security_group.private.id
}


