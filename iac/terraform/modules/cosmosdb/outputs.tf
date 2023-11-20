output "cosmosdb_account_id" {
  value = azurerm_cosmosdb_account.cosmosdb_account.id
}

output "comosdb_connection_strings" {
  value     = "DefaultEndpointsProtocol=https;AccountName=${azurerm_cosmosdb_account.cosmosdb_account.name};AccountKey=${azurerm_cosmosdb_account.cosmosdb_account.primary_key};TableEndpoint=${azurerm_cosmosdb_account.cosmosdb_account.endpoint};"
  sensitive = true
}
