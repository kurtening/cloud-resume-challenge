variable "repository_full_name" {
  description = "Full name of the GitHub repository."
  type        = string
}

variable "function_app_publishing_profile" {
  description = "Value for the FA_PUBLISHING_PROFILE secret."
  type        = list(object({
    name = string
    password = string
  }
  ))
  sensitive = true
}

variable "storage_account_access_key" {
  description = "Value for the SA_ACCESS_KEY secret."
  type        = string
}
