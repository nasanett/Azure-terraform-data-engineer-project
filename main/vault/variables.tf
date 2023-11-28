variable "resource_group_name" {
  description = "The name of the resource group in which to create the Key Vault."
  type        = string
  default     = ""
}

variable "key_vault_name" {
  description = "The name of the Key Vault."
  type        = string
  default     = ""

}

variable "location" {
  description = "The Azure location where the Key Vault should be created."
  type        = string
  default     = ""
}

variable "tenant_id" {
  description = "The Azure tenant ID."
  type        = string
  default     = ""
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to assign to the resource"
  default = {
    Environment = "Dev"
    Project     = "Nasa"
  }
}