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

variable "azure_credentials" {
  description = "Value for the Azure SP Credentials"
  type        = {
    clientId: string
    clientSecret: string
    subscriptionId: string
    tenantId: string
  }
  sensitive = true
  default = {
    clientId = var.ARM_CLIENT_ID
    clientSecret = var.ARM_CLIENT_SECRET
    subscriptionId = var.ARM_SUBSCRIPTION_ID
    tenantId = var.ARM_TENANT_ID
  }
}