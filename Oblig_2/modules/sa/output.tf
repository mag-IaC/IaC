output "storage_account_name" {
  description = "The name of the storage account"
  value       = azurerm_storage_account.this.name
}

output "primary_blob_endpoint" {
  description = "Primary blob endpoint URL for the storage account"
  value       = azurerm_storage_account.this.primary_blob_endpoint
}

output "resource_group_name" {
  description = "Resource group where the storage account resides"
  value       = var.resource_group
}
