variable "region" {
  description = "Azure region"
  type        = string
}

variable "app_service_plan_name" {
  description = "App Service Plan name"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "os_type" {
  description = "Operating system type for the App Service Plan"
  type        = string
}

variable "sku_name" {
  description = "SKU name for the App Service Plan"
  type        = string
}

variable "function_app_name" {
  description = "Function App name"
  type        = string
}

variable "storage_account_name" {
  description = "Storage account name"
  type        = string
}

variable "storage_account_access_key" {
  description = "Storage account access key"
  type        = string
}

variable "application_insights_key" {
  description = "Application Insights instrumentation key"
  type        = string
}

variable "cosmosdb_account_connection_string" {
  description = "The connection string of cosmosdb account"
  type        = string
}
