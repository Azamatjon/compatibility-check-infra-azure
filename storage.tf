resource "azurerm_storage_account" "storage" {
  name                     = var.storage.account_name
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_share" "fileshare" {
  name                 = var.storage.share_name
  storage_account_name = azurerm_storage_account.storage.name
  quota                = var.storage.quota
}

# Output for Kubernetes
output "storage_account_name" {
  value = azurerm_storage_account.storage.name
}

output "storage_account_key" {
  value     = azurerm_storage_account.storage.primary_access_key
  sensitive = true
}

output "file_share_name" {
  value = azurerm_storage_share.fileshare.name
}
