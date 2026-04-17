variable "name" {
  description = "Log Analytics workspace name"
  type        = string
}

variable "location" {
  description = "Azure region for the workspace"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name for the workspace"
  type        = string
}

variable "sku" {
  description = "Log Analytics pricing SKU"
  type        = string
  default     = "PerGB2018"
}

variable "retention_in_days" {
  description = "Retention period for logs"
  type        = number
  default     = 30
}

variable "tags" {
  description = "Tags to apply to the workspace"
  type        = map(string)
  default     = {}
}