output "resource_group_name" {
  description = "The name of the resource group in which resources are created"
  value       = local.resource_group_name
}

output "resource_group_location" {
  description = "The location of the resource group in which resources are created"
  value       = local.location
}

output "sql_server_id" {
  description = "The primary Microsoft SQL Server ID"
  value       = azurerm_mssql_server.server.id
}

output "sql_server_fqdn" {
  description = "The fully qualified domain name of the primary Azure SQL Server"
  value       = azurerm_mssql_server.server.fully_qualified_domain_name
}

output "sql_server_admin_user" {
  description = "SQL database administrator login id"
  value       = azurerm_mssql_server.server.administrator_login
  sensitive   = true
}

output "sql_server_admin_password" {
  description = "SQL database administrator login password"
  value       = azurerm_mssql_server.server.administrator_login_password
  sensitive   = true
}

output "sql_database_id" {
  description = "The SQL Database ID"
  value       = azurerm_mssql_database.db.id
}

output "sql_database_name" {
  description = "The SQL Database Name"
  value       = azurerm_mssql_database.db.name
}
