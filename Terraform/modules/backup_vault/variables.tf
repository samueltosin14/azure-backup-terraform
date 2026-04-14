variable "name" {
  description = "Name of the backup vault"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region for the backup vault"
  type        = string
}

variable "datastore_type" {
  description = "Type of datastore for the backup vault"
  type        = string
  default     = "VaultStore"
}

variable "redundancy" {
  description = "Storage redundancy for the backup vault"
  type        = string
  default     = "LocallyRedundant"
}

variable "identity_type" {
  description = "Managed identity type for the backup vault"
  type        = string
  default     = "SystemAssigned"
}

variable "tags" {
  description = "Tags to apply to the backup vault"
  type        = map(string)
  default     = {}
}