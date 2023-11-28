output "key_vault_id" {
  description = "The ID of the created Key Vault."
  value       = azurerm_key_vault.key_vault.id
}

output "key_vault_name" {
  description = "The name of the created Key Vault."
  value       = azurerm_key_vault.key_vault.name
}

output "key_vault_uri" {
  description = "The URI of the created Key Vault."
  value       = azurerm_key_vault.key_vault.vault_uri
}