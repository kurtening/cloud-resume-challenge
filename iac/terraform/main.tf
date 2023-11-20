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
