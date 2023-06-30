output "id" {
  description = "ID of the AMI"
  value       = data.aws_ami.ubuntu.id
}

output "instance_id" {
  value       = aws_instance.this.*.id
}

output "arn" {
  description = "The ARN of the instance"
  value       = aws_instance.this.*.arn
}

output "private_dns" {
  description = "The private DNS name assigned to the instance. Can only be used inside the Amazon EC2, and only available if you've enabled DNS hostnames for your VPC"
  value       = aws_instance.this.*.private_dns
}
