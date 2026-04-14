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