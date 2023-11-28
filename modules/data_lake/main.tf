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
# Storage account creation - bronze
#---------------------------------------------------------
resource "azurerm_storage_account" "bronze" {
  name                     = var.bronze_storage_name
  resource_group_name      = local.resource_group_name
  location                 = local.location
  account_kind             = var.storage_config.account_kind
  account_tier             = var.storage_config.account_tier
  account_replication_type = var.storage_config.account_replication_type
  is_hns_enabled           = var.storage_config.is_hns_enabled
  blob_properties {
    delete_retention_policy {
      days = var.storage_config.blob_properties.delete_retention_policy.days
    }
    container_delete_retention_policy {
      days = var.storage_config.blob_properties.container_delete_retention_policy.days
    }
  }
}

resource "azurerm_storage_container" "bronze" {
  name                  = "bronze"
  storage_account_name  = azurerm_storage_account.bronze.name
  container_access_type = "private"
}

#---------------------------------------------------------
# Storage account creation - silver 
#---------------------------------------------------------
resource "azurerm_storage_account" "silver" {
  name                     = var.silver_storage_name
  resource_group_name      = local.resource_group_name
  location                 = local.location
  account_kind             = var.storage_config.account_kind
  account_tier             = var.storage_config.account_tier
  account_replication_type = var.storage_config.account_replication_type
  is_hns_enabled           = var.storage_config.is_hns_enabled
  blob_properties {
    delete_retention_policy {
      days = var.storage_config.blob_properties.delete_retention_policy.days
    }
    container_delete_retention_policy {
      days = var.storage_config.blob_properties.container_delete_retention_policy.days
    }
  }
}

resource "azurerm_storage_container" "silver" {
  name                  = "silver"
  storage_account_name  = azurerm_storage_account.silver.name
  container_access_type = "private"
}

#---------------------------------------------------------
# Storage account creation - gold 
#---------------------------------------------------------
resource "azurerm_storage_account" "gold" {
  name                     = var.gold_storage_name
  resource_group_name      = local.resource_group_name
  location                 = local.location
  account_kind             = var.storage_config.account_kind
  account_tier             = var.storage_config.account_tier
  account_replication_type = var.storage_config.account_replication_type
  is_hns_enabled           = var.storage_config.is_hns_enabled
  blob_properties {
    delete_retention_policy {
      days = var.storage_config.blob_properties.delete_retention_policy.days
    }
    container_delete_retention_policy {
      days = var.storage_config.blob_properties.container_delete_retention_policy.days
    }
  }
}

resource "azurerm_storage_container" "gold" {
  name                  = "gold"
  storage_account_name  = azurerm_storage_account.gold.name
  container_access_type = "private"
}
