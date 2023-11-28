variable "repository_full_name" {
  description = "Full name of the GitHub repository."
  type        = string
}

variable "function_app_name" {
  description = "Value for the function app name"
  type        = string
}

variable "storage_account_access_key" {
  description = "Value for the SA_ACCESS_KEY secret."
  type        = string
}

variable "azure_credentials_plaintext" {
  description = "Plaintext value for Azure Credentials"
  sensitive   = true
}

variable "function_app_hostname" {
  description = "The hostname of the function app"
  sensitive   = true
}

variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
}