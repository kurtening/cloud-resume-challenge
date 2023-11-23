data "github_repository" "repository" {
  full_name = var.repository_full_name
}

resource "github_actions_secret" "function_app_publishing_profile" {
  repository      = data.github_repository.repository.name
  secret_name     = "FA_PUBLISHING_PROFILE"
  plaintext_value = var.function_app_publishing_profile[0].password
}

resource "github_actions_environment" "storage_account_access_key" {
  repository      = data.github_repository.repository.name
  secret_name     = "SA_ACCESS_KEY"
  plaintext_value = var.storage_account_access_key
}

resource "github_actions_variable" "function_app_name" {
  repository = data.github_repository.repository.name
  variable_name = "FA_NAME"
  value = replace(var.function_app_publishing_profile[0].name, "$", "")
}
