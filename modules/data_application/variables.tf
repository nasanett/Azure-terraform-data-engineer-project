variable "azure_region" {
  type        = string
  description = "Azure Region for deployment."
}

variable "create_resource_group" {
  type        = bool
  description = "Is resource group managed by this script?"
  default     = false
}

variable "resource_group_name" {
  type        = string
  description = "A resource group name for metastore function."
}

variable "random_password_length" {
  type        = number
  description = "The desired length of random password created by this module"
  default     = 32
}

variable "sqlserver_name" {
  type        = string
  description = "SQL server Name"
  default     = ""
}

variable "admin_username" {
  type        = string
  description = "The administrator login name for the new SQL Server"
  default     = null
}

variable "admin_password" {
  type        = string
  description = "The password associated with the admin_username user"
  default     = null
}

variable "database_name" {
  type        = string
  description = "The name of the database"
  default     = ""
}

variable "enable_private_endpoint" {
  type        = bool
  description = "Manages a Private Endpoint to SQL database"
  default     = false
}
