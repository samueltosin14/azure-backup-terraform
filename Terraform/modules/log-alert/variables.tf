variable "name" {
  description = "Log alert rule name"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group for the alert rule"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "Log Analytics workspace resource ID"
  type        = string
}

variable "action_group_id" {
  description = "Azure Monitor Action Group ID"
  type        = string
}

variable "query" {
  description = "KQL query for the alert"
  type        = string
}

variable "description" {
  description = "Alert description"
  type        = string
  default     = "Backup failure alert"
}

variable "severity" {
  description = "Severity of the alert"
  type        = number
  default     = 2
}

variable "frequency_in_minutes" {
  description = "How often the query runs"
  type        = number
  default     = 5
}

variable "time_window_in_minutes" {
  description = "Time window for the query"
  type        = number
  default     = 15
}