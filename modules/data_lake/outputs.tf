output "resource_group_name" {
  description = "The name of the resource group in which resources are created"
  value       = local.resource_group_name
}

output "resource_group_location" {
  description = "The location of the resource group in which resources are created"
  value       = local.location
}

output "bronze_lake_storage_id" {
  value = azurerm_storage_account.bronze.id
}

output "silver_lake_storage_id" {
  value = azurerm_storage_account.silver.id
}

output "gold_lake_storage_id" {
  value = azurerm_storage_account.gold.id
}
