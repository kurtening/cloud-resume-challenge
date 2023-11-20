variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "cdn_profile_name" {
  description = "CDN profile name"
  type        = string
}

variable "sku" {
  description = "CDN profile SKU"
  type        = string
}

variable "cdn_endpoint_name" {
  description = "CDN endpoint name"
  type        = string
}

variable "cdn_endpoint_origin_name" {
  description = "CDN endpoint origin name"
  type        = string
}

variable "cdn_endpoint_origin_host_name" {
  description = "CDN endpoint origin host name"
  type        = string
}

variable "cdn_endpoint_custom_domain_name" {
  description = "CDN endpoint custom domain name"
  type        = string
}

variable "cdn_endpoint_custom_domain_host_name" {
  description = "CDN endpoint custom domain host name"
  type        = string
}
