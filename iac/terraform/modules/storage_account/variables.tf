variable "region" {
  description = "Azure region"
  type        = string
}

variable "storage_account_name" {
  description = "Storage account name"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "account_replication_type" {
  description = "Account replication type"
  type        = string
}

variable "account_tier" {
  description = "Account tier"
  type        = string
}

variable "index_document" {
  description = "Static website configuration"
  type        = string
  default     = "index.html"
}
