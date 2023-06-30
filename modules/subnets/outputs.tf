output "this_subnets" {
  description = "Map of Subnets return attributes"
  value       = aws_subnet.this
}

output "this_subnets_ids" {
  description = "List: IDs of Subnets"
  value       = [for subnet in aws_subnet.this: subnet.id] 
}

# output "publicsubnet1" {
#     value = aws_subnet.public1.id
# }

# output "publicsubnet2" {
#     value = aws_subnet.private1.id
# }