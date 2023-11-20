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

