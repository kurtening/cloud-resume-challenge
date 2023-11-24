data "github_repository" "repository" {
  full_name = var.repository_full_name
}

resource "github_repository_environment" "repository_environment" {
  repository  = data.github_repository.repository.name
  environment = var.environment
}

resource "github_actions_environment_secret" "function_app_publishing_profile" {
  repository      = data.github_repository.repository.name
  environment     = github_repository_environment.repository_environment.environment
  secret_name     = "FA_PUBLISHING_PROFILE"
  plaintext_value = jsonencode(var.function_app_publishing_profile)
}

resource "github_actions_environment_secret" "storage_account_access_key" {
  repository      = data.github_repository.repository.name
  environment     = github_repository_environment.repository_environment.environment
  secret_name     = "SA_ACCESS_KEY"
  plaintext_value = var.storage_account_access_key
}

resource "github_actions_environment_variable" "function_app_name" {
  repository = data.github_repository.repository.name
  environment = var.environment
  variable_name = "FA_NAME"
  value = replace(var.function_app_publishing_profile[0].name, "$", "")
}
