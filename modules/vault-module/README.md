# Azure Key Vault Terraform Module

This Terraform module provisions an Azure Key Vault with configurable settings and access policies.

## Table of Contents

- [Usage](#usage)
- [Module Input Variables](#module-input-variables)
- [Module Output Variables](#module-output-variables)
- [Examples](#examples)
- [Contributing](#contributing)
- [License](#license)

## Usage

```
module "azure_key_vault" {
  source = "module-path"

  # Define module input variables here
  key_vault_name        = "example-keyvault"
  resource_group_name   = "example-resource-group"
  location              = "East US"
  # ...
}

## Module Input Variables

The following input variables are available for this module:

- `key_vault_name` (required): The name to provide for the Key Vault. The name must be globally unique.
- `resource_group_name` (required): The name of the resource group in which to create the Key Vault.
- `location` (required): Azure region where the Key Vault should be created.
- `sku_name` (optional): The name of the SKU used for this Key Vault (default: "standard").
- `enabled_for_disk_encryption` (optional): Boolean flag to specify whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys (default: true).
- `soft_delete_retention_days` (optional): The number of days that items should be retained for once soft-deleted (default: 7).
- `tags` (optional): A map of tags to assign to the Key Vault (default: {}).
- `ip_rules` (optional): Map of IP addresses permitted to access the Key Vault (default: null).
- `virtual_networks` (optional): List of resource IDs for subnets (default: null).

## Module Output Variables

The following output variables are available for this module:

- `key_vault_id`: The resource ID of the created Azure Key Vault.
- `key_vault_name`: The name of the created Azure Key Vault.
- `key_vault_uri`: The URI of the created Azure Key Vault.