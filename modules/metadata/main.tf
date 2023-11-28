# This module creates all reasources for metadata resoruce groups:
# - metadata resource group:
#   - storage account for unity catalog metastore
#   - a container for the uniyrt catalog metastore
# - a system-assigned identity for databricsk (databricks connector)
# - assigns required roles on the storage account to the databricks connector

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

#---------------------------------------------------------
# Storage account creation
#---------------------------------------------------------
resource "azurerm_storage_account" "unitymeta_storage" {
  name                     = var.storage_name
  resource_group_name      = local.resource_group_name
  location                 = local.location
  account_kind             = var.storage_config.account_kind
  account_tier             = var.storage_config.account_tier
  account_replication_type = var.storage_config.account_replication_type
  is_hns_enabled           = true
}

#---------------------------------------------------------
# Storage account container creation
#---------------------------------------------------------
resource "azurerm_storage_container" "unitymeta" {
  name                  = "unity-metastore"
  storage_account_name  = azurerm_storage_account.unitymeta_storage.name
  container_access_type = "private"
}

#---------------------------------------------------------
# Databricks managed identity creation
#---------------------------------------------------------
resource "azurerm_databricks_access_connector" "dbaccess_for_unity" {
  name                = var.databricks_connector_name
  resource_group_name = local.resource_group_name
  location            = local.location
  identity {
    type = "SystemAssigned"
  }
}

#---------------------------------------------------------
# Role assignemnt - db connecotr x metastore storage 
#---------------------------------------------------------
resource "azurerm_role_assignment" "assignment1" {
  scope                = azurerm_storage_account.unitymeta_storage.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_databricks_access_connector.dbaccess_for_unity.identity[0].principal_id
}


