variable "github_token" {
  description = "The GitHub token"
  type        = string
}

variable "region" {
  description = "The Azure region"
  type        = string
}

variable "region_code" {
  description = "The region code for naming conventions"
  type        = string
}

variable "project_code" {
  description = "The project code for naming conventions"
  type        = string
}

variable "env_code" {
  description = "The environment code for naming conventions"
  type        = string
}

variable "environment" {
  description = "The environment (e.g., development, production)"
  type        = string
}

variable "cdn_endpoint_custom_domain_host_name" {
  description = "The custom domain host name for CDN endpoint"
  type        = string
}

variable "github_repository_full_name" {
  description = "The full name of the GitHub repository"
  type        = string
}

variable "azure_credentials_plaintext" {
  description = "Azure SP Credentials in Plaintext"
  type        = string
  sensitive   = true
}