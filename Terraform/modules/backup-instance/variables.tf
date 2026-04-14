variable "name" {
  type = string
}

variable "backup_vault_id" {
  type = string
}

variable "storage_account_id" {
  type = string
}

variable "storage_account_name" {
  type = string
}

variable "location" {
  type = string
}

variable "backup_policy_id" {
  type = string
}

variable "resource_group_id" {
  type = string
}

variable "containers_list" {
  type = list(string)
}