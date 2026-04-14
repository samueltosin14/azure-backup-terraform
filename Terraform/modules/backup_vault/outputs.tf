output "id" {
  value = azurerm_data_protection_backup_vault.this.id
}

output "name" {
  value = azurerm_data_protection_backup_vault.this.name
}

output "principal_id" {
  value = azurerm_data_protection_backup_vault.this.identity[0].principal_id
}