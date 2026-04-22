variable "name" {
  description = "Logic App workflow name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "tags" {
  description = "Tags for the Logic App"
  type        = map(string)
  default     = {}
}