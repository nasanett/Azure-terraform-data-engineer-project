terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.75.0"
    }
  }
}

# Determine the resource group name and location based on inputs
locals {
  resource_group_name = element(coalescelist(data.azurerm_resource_group.rgrp.*.name, azurerm_resource_group.rg.*.name, [""]), 0)
  location            = element(coalescelist(data.azurerm_resource_group.rgrp.*.location, azurerm_resource_group.rg.*.location, [""]), 0)
}

#---------------------------------------------------------
# Resource Group Creation or selection - Default is "false"
#----------------------------------------------------------
data "azurerm_resource_group" "rgrp" {
  count = var.create_resource_group == false ? 1 : 0
  name  = var.resource_group_name
}

resource "azurerm_resource_group" "rg" {
  count    = var.create_resource_group ? 1 : 0

  
  name     = var.resource_group_name
  location = var.azure_region
}
// Create the databricks workspace
resource "azurerm_databricks_workspace" "module-databricks" {
  name                = var.workspace_name
  resource_group_name = var.resource_group_name
  location            = var.azure_region
  sku                 = "standard"
  tags = var.tags
}

resource "azurerm_databricks_access_connector" "this" {
  count = var.access_connector_enabled ? 1 : 0

  name                = coalesce(var.access_connector_name, "ac-${var.workspace_name}")
  resource_group_name = var.resource_group_name
  location            = var.azure_region
  tags                = var.tags

  identity {
    type = "SystemAssigned"
  }
}