variable "location" {
  description = "Azure region"
  type        = string
}

variable "application_insights_name" {
  description = "Application Insights name"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "workspace_id" {
  description = "ID of the Log Analytics Workspace"
  type        = string
}

variable "application_type" {
  description = "Application type"
  type        = string
  default     = "other"
}
