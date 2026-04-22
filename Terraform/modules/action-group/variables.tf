variable "name" {
  description = "Short name of the action group resource"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "short_name" {
  description = "Short name used by Azure Monitor notifications"
  type        = string
}

variable "email_receiver_name" {
  description = "Name of the email receiver"
  type        = string
}

variable "email_address" {
  description = "Email address to receive alerts"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the action group"
  type        = map(string)
  default     = {}
}

variable "logic_app_callback_url" {
  description = "Logic App HTTP trigger URL"
  type        = string
}