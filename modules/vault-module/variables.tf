variable "resource_group_name" {
  description = "The name of the resource group in which to create the Key Vault."
  type        = string
  default     = "my-rg-2"
}

variable "key_vault_name" {
  description = "The name of the Key Vault."
  type        = string
  default     = "nett-key-v"

}

variable "create_resource_group" {
  type        = bool
  description = "Is resource group managed by this script?"
  default     = true
}

variable "azure_region" {
  description = "The Azure location where the Key Vault should be created."
  type        = string
  default     = "east us"
}

variable "tenant_id" {
  description = "The Azure tenant ID."
  type        = string
  default    =  "7ed87b76-a4d9-4f49-ae6e-0d83d6ce680e"
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to assign to the resource"
  default = {
    Environment = "Dev"
    Project     = "Nasa"
  }
}