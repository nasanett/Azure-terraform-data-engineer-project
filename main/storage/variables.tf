variable "resource_group_name" {
  description = "The name of the resource group in which to create the Key Vault."
  type        = string
  default     = ""
}

variable "storage_account_name" {
  description = "The name of the Key Vault."
  type        = string
  default     = ""

}

variable "location" {
  description = "The Azure location where the Key Vault should be created."
  type        = string
  default     = ""
}

variable "container_name" {
  description = "The Container name."
  type        = string
  default     = ""
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
