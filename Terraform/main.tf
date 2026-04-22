module "resource_group" {
  source = "./modules/resource-group"

  name     = "${local.name_prefix}-rg"
  location = var.location
  tags     = local.common_tags
}

module "storage_account" {
  source = "./modules/storage-account"

  name                = "bb${var.environment}store01"
  resource_group_name = module.resource_group.name
  location            = var.location
  container_name      = "backup-data"
  tags                = local.common_tags
}

module "backup_vault" {
  source = "./modules/backup_vault"

  name                = "${local.name_prefix}-bv"
  resource_group_name = module.resource_group.name
  location            = var.location
  tags                = local.common_tags
}

module "backup_vault_role_assignment" {
  source = "./modules/role-assignment"

  scope        = module.storage_account.id
  role_name    = "Storage Account Backup Contributor"
  principal_id = module.backup_vault.principal_id
}

module "backup_instance" {
  source = "./modules/backup-instance"

  name                 = "${local.name_prefix}-instance"
  backup_vault_id      = module.backup_vault.id
  storage_account_id   = module.storage_account.id
  storage_account_name = module.storage_account.name
  location             = var.location
  resource_group_id    = module.resource_group.id
  backup_policy_id     = var.backup_policy_id

  containers_list = ["backup-data"]
}

module "log_analytics" {
  source = "./modules/log-analytics"

  name                = "${local.name_prefix}-law"
  location            = var.location
  resource_group_name = module.resource_group.name
  tags                = local.common_tags
}

module "backup_vault_diagnostics" {
  source = "./modules/diagnostic-setting"

  name                       = "${local.name_prefix}-bv-diag"
  target_resource_id         = module.backup_vault.id
  log_analytics_workspace_id = module.log_analytics.id

  log_categories = [
    "CoreAzureBackup",
    "AddonAzureBackupJobs",
    "AddonAzureBackupPolicy",
    "AddonAzureBackupProtectedInstance",
  ]

  metric_categories = ["AllMetrics"]
}

module "storage_account_diagnostics" {
  source = "./modules/diagnostic-setting"

  name                       = "${local.name_prefix}-sa-diag"
  target_resource_id         = module.storage_account.id
  log_analytics_workspace_id = module.log_analytics.id

  log_categories    = []
  metric_categories = ["AllMetrics"]
}


module "action_group" {
  source = "./modules/action-group"

  name                = "${local.name_prefix}-ag"
  resource_group_name = module.resource_group.name
  short_name          = "bbdevag"
  email_receiver_name = "primary-email"
  email_address       = var.alert_email_address
  tags                = local.common_tags
  logic_app_callback_url = var.logic_app_callback_url
}

module "backup_failure_alert" {
  source = "./modules/log-alert"

  name                       = "${local.name_prefix}-backup-failure-alert"
  resource_group_name        = module.resource_group.name
  location                   = var.location
  log_analytics_workspace_id = module.log_analytics.id
  action_group_id            = module.action_group.id

  description = "Alert when backup-related failures are detected in Log Analytics"

  query = <<-QUERY
    AzureDiagnostics
    | where TimeGenerated >= ago(15m)
    | where Category has "Backup"
    | where Level == "Error" or ResultDescription has "fail" or OperationName has "fail"
  QUERY
}

module "logic_app" {
  source = "./modules/logic-app"

  name                = "${local.name_prefix}-logicapp"
  location            = var.location
  resource_group_name = module.resource_group.name
  tags                = local.common_tags
}