resource "azapi_resource" "backup_instance" {
  type      = "Microsoft.DataProtection/backupVaults/backupInstances@2024-04-01"
  name      = var.name
  parent_id = var.backup_vault_id

  body = {
    properties = {
      objectType   = "BackupInstance"
      friendlyName = var.name

      dataSourceInfo = {
        datasourceType   = "Microsoft.Storage/storageAccounts/blobServices"
        objectType       = "Datasource"
        resourceID       = var.storage_account_id
        resourceLocation = var.location
        resourceName     = var.storage_account_name
        resourceProperties = {
          objectType = "DefaultResourceProperties"
        }
      }

      policyInfo = {
        policyId = var.backup_policy_id

        policyParameters = {
          backupDatasourceParametersList = [
            {
              objectType     = "BlobBackupDatasourceParameters"
              containersList = var.containers_list
            }
          ]

          dataStoreParametersList = [
            {
              dataStoreType   = "OperationalStore"
              objectType      = "AzureOperationalStoreParameters"
              resourceGroupId = var.resource_group_id
            }
          ]
        }
      }
    }
  }
}