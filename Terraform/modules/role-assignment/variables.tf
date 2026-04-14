variable "scope" {
  type        = string
  description = "Scope for the role assignment"
}

variable "role_name" {
  type        = string
  description = "Role name to assign"
}

variable "principal_id" {
  type        = string
  description = "Principal ID of the identity"
}