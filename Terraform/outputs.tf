output "name_prefix" {
  value = local.name_prefix
}

output "resource_group_name" {
  value = module.resource_group.name
}

output "resource_group_id" {
  value = module.resource_group.id
}

output "storage_account_name" {
  value = module.storage_account.name
}

output "storage_container_name" {
  value = module.storage_account.container_name
}

output "storage_blob_endpoint" {
  value = module.storage_account.primary_blob_endpoint
}

output "backup_vault_name" {
  value = module.backup_vault.name
}

output "backup_vault_id" {
  value = module.backup_vault.id
}

output "backup_vault_principal_id" {
  value = module.backup_vault.principal_id
}