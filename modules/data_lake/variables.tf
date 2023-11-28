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

variable "bronze_storage_name" {
  type        = string
  description = "A storage account name for the bronze data layer"
}

variable "silver_storage_name" {
  type        = string
  description = "A storage account name for the silver data layer"
}

variable "gold_storage_name" {
  type        = string
  description = "A storage account name for the gold data layer"
}

variable "storage_config" {
  type = object({
    account_tier             = string,
    account_replication_type = string,
    account_kind             = string,
    is_hns_enabled           = bool
    blob_properties = object({
      delete_retention_policy = object({
        days = number
      }),
      container_delete_retention_policy = object({
        days = number
      })
    })
  })
  default = {
    account_kind             = "StorageV2"
    account_tier             = "Standard"
    account_replication_type = "ZRS"
    is_hns_enabled           = true
    blob_properties = {
      delete_retention_policy = {
        days = 30
      }
      container_delete_retention_policy = {
        days = 7
      }
    }
  }
}

variable "enable_private_endpoint" {
  type        = bool
  description = "Manages a Private Endpoint to SQL database"
  default     = false
}
