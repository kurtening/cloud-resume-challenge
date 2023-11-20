resource "azurerm_storage_account" "storage_account" {
  name                            = var.storage_account_name
  resource_group_name             = var.resource_group_name
  account_replication_type        = var.account_replication_type
  location                        = var.region
  account_tier                    = var.account_tier
  allow_nested_items_to_be_public = false
  access_tier                     = "Hot"

  static_website {
    index_document = var.index_document
  }

}