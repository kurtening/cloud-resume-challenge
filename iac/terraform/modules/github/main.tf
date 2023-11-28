data "github_repository" "repository" {
  full_name = var.repository_full_name
}

resource "github_actions_secret" "storage_account_access_key" {
  repository      = data.github_repository.repository.name
  secret_name     = "SA_ACCESS_KEY"
  plaintext_value = var.storage_account_access_key
}

resource "github_actions_secret" "azure_credentials" {
  repository      = data.github_repository.repository.name
  secret_name     = "AZURE_CREDENTIALS"
  plaintext_value = var.azure_credentials_plaintext

}

resource "github_actions_variable" "function_app_name" {
  repository    = data.github_repository.repository.name
  variable_name = "FA_NAME"
  value         = var.function_app_name
}

resource "github_actions_variable" "function_app_hostname" {
  repository    = data.github_repository.repository.name
  variable_name = "FA_HOSTNAME"
  value         = var.function_app_hostname
}