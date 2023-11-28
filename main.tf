terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.75.0"
    }
  }
  backend "azurerm" {
  }
}

provider "azurerm" {
  features {}
}

# To be moved into variables at a later stage
locals {
  azure_region                 = "West Europe"
  metadata_resource_group_name = "rg-sme-metadata-we"
  metadata_storage_name        = "unitymetasmewe"
  key_vault_name               = "key-vault"
  metadata_storage_config = {
    account_kind             = "StorageV2"
    account_tier             = "Standard"
    account_replication_type = "ZRS"
  }
  metadata_databricks_connector_name = "dbc-sme-unity-we"
  dataapp_resource_group_name        = "rg-sme-da-we"
  dataapp_sqlserver_name             = "sql-sme-we-001"
  dataapp_database_name              = "sqldw-sme-001"
  data_lake_resource_group_name      = "rg-sme-dls-we"
  key_vault_resource_group_name      = "rg-key-vault"
  storage_account_resource_group_name = "rg-storage-account"
  data_bricks_resource_group_name    = "rg-data_bricks"
  databricks_workspace_name          = "db-ws"
  storage_account_name               = "storage-account"
  create_storage_account             = "true"
  data_lake_bronze_storage_name      = "dlssmewe001"
  data_lake_silver_storage_name      = "dlssmewe002"
  data_lake_gold_storage_name        = "dlssmewe003"
}

# Metadata module (for unity catalog metastore)
# ---------
module "metadata" {
  source                    = "./modules/metadata"
  azure_region              = local.azure_region
  resource_group_name       = local.metadata_resource_group_name
  storage_name              = local.metadata_storage_name
  storage_config            = local.metadata_storage_config
  databricks_connector_name = local.metadata_databricks_connector_name
}

# Data application module (for data model serving)
# ---------
module "data_application" {
  source              = "./modules/data_application"
  azure_region        = local.azure_region
  resource_group_name = local.dataapp_resource_group_name
  sqlserver_name      = local.dataapp_sqlserver_name
  database_name       = local.dataapp_database_name
}

# Data lake module
# ---------
module "data_lake" {
  source              = "./modules/data_lake"
  azure_region        = local.azure_region
  resource_group_name = local.data_lake_resource_group_name
  bronze_storage_name = local.data_lake_bronze_storage_name
  silver_storage_name = local.data_lake_silver_storage_name
  gold_storage_name   = local.data_lake_gold_storage_name
}

module "key_vault" {
  source = "./modules/vault-module"
  resource_group_name = local.key_vault_resource_group_name
  azure_region        = local.azure_region
  key_vault_name      = local.key_vault_name
  tags = {
    environment = "dev"
  }
}

module "storage" {
  source = "./modules/storage-module"
  resource_group_name    = local.storage_account_resource_group_name
  azure_region           = local.azure_region
  create_storage_account = local.create_storage_account
  storage_account_name   = local.storage_account_name
  container_name         = "container-name"
}

module "databricks" {
  source = "./modules/data_bricks"
  resource_group_name      = local.data_bricks_resource_group_name
  azure_region             = local.azure_region
  workspace_name           = local.databricks_workspace_name
  tags = {
    Env = "Dev"
  }
}