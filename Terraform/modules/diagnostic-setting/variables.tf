variable "name" {
  description = "Diagnostic setting name"
  type        = string
}

variable "target_resource_id" {
  description = "Resource ID to attach diagnostic settings to"
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "Log Analytics workspace resource ID"
  type        = string
}

variable "log_categories" {
  description = "List of log categories to enable"
  type        = list(string)
  default     = []
}

variable "metric_categories" {
  description = "List of metric categories to enable"
  type        = list(string)
  default     = ["AllMetrics"]
}