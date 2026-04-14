resource "azurerm_data_protection_backup_vault" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  datastore_type      = var.datastore_type
  redundancy          = var.redundancy

  identity {
    type = var.identity_type
  }

  tags = var.tags
}