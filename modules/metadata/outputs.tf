output "resource_group_name" {
  description = "The name of the resource group in which resources are created"
  value       = local.resource_group_name
}

output "resource_group_location" {
  description = "The location of the resource group in which resources are created"
  value       = local.location
}

output "databricks_connector_id" {
  description = "Datbricks azure access connector id"
  value       = azurerm_databricks_access_connector.dbaccess_for_unity.id
}
