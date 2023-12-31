resource "azurerm_service_plan" "app_service_plan" {
  name                = var.app_service_plan_name
  resource_group_name = var.resource_group_name
  location            = var.region
  os_type             = var.os_type
  sku_name            = var.sku_name
}

resource "azurerm_linux_function_app" "function_app" {
  name                        = var.function_app_name
  resource_group_name         = var.resource_group_name
  location                    = var.region
  storage_account_name        = var.storage_account_name
  storage_account_access_key  = var.storage_account_access_key
  service_plan_id             = azurerm_service_plan.app_service_plan.id
  functions_extension_version = "~4"
  site_config {
    application_insights_key = var.application_insights_key
    application_stack {
      python_version = 3.11
    }
  }
  app_settings = {
    cosmosdb_account_connection_string = var.cosmosdb_account_connection_string
    SCM_DO_BUILD_DURING_DEPLOYMENT     = true
    ENABLE_ORYX_BUILD                  = true
  }
}
