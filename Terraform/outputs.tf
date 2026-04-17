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

output "log_analytics_name" {
  value = module.log_analytics.name
}

output "log_analytics_id" {
  value = module.log_analytics.id
}

output "log_analytics_workspace_id" {
  value = module.log_analytics.workspace_id
}

output "backup_vault_diagnostics_name" {
  value = module.backup_vault_diagnostics.name
}

output "backup_vault_diagnostics_id" {
  value = module.backup_vault_diagnostics.id
}

output "storage_account_diagnostics_name" {
  value = module.storage_account_diagnostics.name
}

output "storage_account_diagnostics_id" {
  value = module.storage_account_diagnostics.id
}


output "action_group_name" {
  value = module.action_group.name
}

output "action_group_id" {
  value = module.action_group.id
}

output "backup_failure_alert_name" {
  value = module.backup_failure_alert.name
}

output "backup_failure_alert_id" {
  value = module.backup_failure_alert.id
}