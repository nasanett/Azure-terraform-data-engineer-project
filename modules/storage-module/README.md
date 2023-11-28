# Terraform Azure Storage Module

This Terraform module creates an Azure Storage Account with a Blob Container.

## Table of Contents

- [Usage](#usage)
- [Module Input Variables](#module-input-variables)
- [Examples](#examples)

## Usage

1. Clone this repository or copy the module files into your Terraform project.

2. In your main Terraform configuration file, include the module like this:

   ```
   module "azure_storage" {
     source                  = "./path/to/module"
     resource_group_name     = "my-resource-group"
     location                = "East US"
     storage_account_name    = "mystorageaccount"
     container_name          = "myblobcontainer"
   }

## Module Input Variables

The module accepts the following input variables:

1. `resource_group_name` (string): Name of the Azure resource group where the storage account will be created.

2. `location` (string): Azure region for the resources. Specify the region where the Azure Storage Account should be deployed.

3. `storage_account_name` (string): Name of the Azure Storage Account. Provide a unique name for your storage account.

4. `container_name` (string): Name of the Blob Storage container. Choose a unique name for your container.



## Example Usage

Here's an example of how to use this module in your Terraform configuration:

```hcl
module "azure_storage" {
  source                  = "./path/to/module"
  resource_group_name     = "my-resource-group"
  location                = "East US"
  storage_account_name    = "mystorageaccount"
  container_name          = "myblobcontainer"
}
