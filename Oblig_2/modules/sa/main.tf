resource "azurerm_storage_account" "this" {
  name                     = var.name
  resource_group_name      = var.resource_group
  location                 = var.location
  account_tier             = var.storage_tier
  account_replication_type = var.replication_type

  min_tls_version          = "TLS1_2"

  tags = {
    Environment = var.environment
    Project     = var.project_name
  }
}
