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

