variable "workspace_name" {
  type        = string
  description = "Name of Databricks workspace"
  default =     "databricks-ws"
}

variable "resource_group_name" {
  type        = string
  description = "Name of resource group into which Databricks will be deployed"
  default =     "my-rg-2"
}

variable "create_resource_group" {
  type        = bool
  description = "Is resource group managed by this script?"
  default     = false
}

variable "azure_region" {
  type        = string
  description = "Location in which Databricks will be deployed"
  default     =  "East us"
}

variable "tags" {
  type        = map(string)
  description = "Map of tags to attach to Databricks workspace"
  default     = {}
}

variable "access_connector_enabled" {
  type        = bool
  description = "Provides an ability to provision Databricks Access Connector which is required for Unity Catalog feature"
  default     = true
}
variable "access_connector_name" {
  type        = string
  description = "Databricks Access Connector optional name"
  default     = "ac-databricks"
}