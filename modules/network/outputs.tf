output "vpc_id" {
  value = aws_vpc.this.id
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}

output "app_subnet_ids" {
  value = aws_subnet.app[*].id
}

output "db_subnet_ids" {
  value = aws_subnet.db[*].id
}

output "app_route_table_id" {
  value = aws_route_table.app.id
}

output "db_route_table_id" {
  value = aws_route_table.db.id
}

output "flow_log_group_name" {
  value = aws_cloudwatch_log_group.flow_logs.name
}
