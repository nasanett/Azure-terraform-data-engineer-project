variable "azure_region" {
  type        = string
  description = "Azure Region for deployment."
}

variable "create_resource_group" {
  type        = bool
  description = "Is resource group managed by this script?"
  default     = true
}

variable "resource_group_name" {
  type        = string
  description = "A resource group name for metastore function."
}

variable "storage_name" {
  type        = string
  description = "A storage account name for the unity metastorage."
}

variable "storage_config" {
  type = object({
    account_tier             = string,
    account_replication_type = string,
    account_kind             = string
  })
  default = {
    account_kind             = "StorageV2"
    account_tier             = "Standard"
    account_replication_type = "ZRS"
  }
}

variable "databricks_connector_name" {
  type        = string
  description = "Databricks connector name for access to unity meta storage."

}

