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

variable "azure_credenitals_plaintext" {
  description = "Plaintext value for Azure Credentials"
  sensitive   = true
}