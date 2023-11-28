output "key_vault_id" {
  description = "The ID of the created Key Vault."
  value       = module.vault.key_vault_id
}

output "key_vault_name" {
  description = "The name of the created Key Vault."
  value       = module.vault.key_vault_name
}

output "key_vault_uri" {
  description = "The URI of the created Key Vault."
  value       = module.vault.key_vault_uri
}