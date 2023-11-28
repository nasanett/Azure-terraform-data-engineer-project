variable "resource_group_name" {
  description = "The name of the resource group in which to create the Key Vault."
  type        = string
  default     = "my-rg-2"
}

variable "storage_account_name" {
  description = "The name of the Key Vault."
  type        = string
  default     = "nasanettivo12345"

}

variable "create_resource_group" {
  type        = bool
  description = "Is resource group managed by this script?"
  default     = true
}

variable "azure_region" {
  description = "The Azure location where the Key Vault should be created."
  type        = string
  default     = "East us"
}

variable "container_name" {
  description = "The Container name."
  type        = string
  default     = "terraformstatefile"
}

variable "create_storage_account" {
  description = "Create a new azure storage account "
  type        = bool
  default     = true
}

variable "create_container" {
  description = "Create a new Blob container "
  type        = bool
  default     = true
}