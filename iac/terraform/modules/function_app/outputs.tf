output "function_app_publishing_profile" {
  value       = azurerm_linux_function_app.function_app.site_credential
  description = "Publishing Profile Credentials for the Function App"
  sensitive   = true
}
