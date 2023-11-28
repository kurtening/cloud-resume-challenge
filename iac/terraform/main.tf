terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.80.0"
    }
  }
  required_version = ">= 1.6.0"
}

provider "azurerm" {
  features {}
}

provider "github" {
  token = var.github_token
}

module "naming" {
  version = "0.4.0"
  source  = "Azure/naming/azurerm"
  prefix  = [var.region_code, var.project_code]
  suffix  = [var.env_code]
}

locals {
  common_tags = {
    environment = var.environment
    projectCode = var.project_code
  }
  resource_group_name = module.naming.resource_group.name
}

resource "azurerm_resource_group" "resource_group" {
  name     = local.resource_group_name
  location = var.region
  tags     = local.common_tags
}

module "storage_account" {
  source                   = "./modules/storage_account"
  region                   = var.region
  storage_account_name     = module.naming.storage_account.name
  resource_group_name      = azurerm_resource_group.resource_group.name
  account_replication_type = var.environment == "development" ? "LRS" : "ZRS"
  account_tier             = "Standard"
}

module "log_analytics_workspace" {
  source                       = "./modules/log_analytics_workspace"
  region                       = var.region
  log_analytics_workspace_name = module.naming.log_analytics_workspace.name
  resource_group_name          = azurerm_resource_group.resource_group.name
}

module "application_insights" {
  source                    = "./modules/application_insights"
  location                  = var.region
  application_insights_name = module.naming.application_insights.name
  resource_group_name       = azurerm_resource_group.resource_group.name
  workspace_id              = module.log_analytics_workspace.log_analytics_workspace_id
  # Uncomment below for different app-type. Default is "other"
  # application_type        = "your-app-type"
}

module "cosmosdb" {
  source                = "./modules/cosmosdb"
  location              = var.region
  cosmosdb_account_name = module.naming.cosmosdb_account.name
  resource_group_name   = azurerm_resource_group.resource_group.name
}

module "function_app" {
  source                             = "./modules/function_app"
  region                             = var.region
  app_service_plan_name              = module.naming.app_service_plan.name
  resource_group_name                = azurerm_resource_group.resource_group.name
  os_type                            = "Linux"
  sku_name                           = "Y1"
  function_app_name                  = module.naming.function_app.name
  storage_account_name               = module.storage_account.storage_account_name
  storage_account_access_key         = module.storage_account.storage_account_access_key
  application_insights_key           = module.application_insights.application_insights_instrumentation_key
  cosmosdb_account_connection_string = module.cosmosdb.comosdb_connection_strings
}

module "cdn" {
  source                               = "./modules/cdn"
  location                             = var.region
  resource_group_name                  = azurerm_resource_group.resource_group.name
  cdn_profile_name                     = module.naming.cdn_profile.name
  sku                                  = "Standard_Microsoft"
  cdn_endpoint_name                    = var.project_code
  cdn_endpoint_origin_name             = "storage-account-web-host"
  cdn_endpoint_origin_host_name        = module.storage_account.storage_account_primary_web_host
  cdn_endpoint_custom_domain_name      = replace(var.cdn_endpoint_custom_domain_host_name, ".", "-")
  cdn_endpoint_custom_domain_host_name = var.cdn_endpoint_custom_domain_host_name
}

module "github" {
  source                      = "./modules/github"
  repository_full_name        = var.github_repository_full_name
  function_app_name           = module.function_app.function_app_name
  storage_account_name        = module.storage_account.storage_account_name
  storage_account_access_key  = module.storage_account.storage_account_access_key
  azure_credentials_plaintext = var.azure_credentials_plaintext
  function_app_hostname       = module.function_app.function_app_hostname
}
