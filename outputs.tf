# Output ACR credentials with sensitive attribute
output "acr_login_server" {
  value = azurerm_container_registry.acr.login_server
}

output "acr_username" {
  value     = azurerm_container_registry.acr.admin_username
  sensitive = true
}

output "acr_password" {
  value     = azurerm_container_registry.acr.admin_password
  sensitive = true
}


output "azure_client_id" {
  value     = var.client_id
  sensitive = true
}

output "azure_client_secret" {
  value     = var.client_secret
  sensitive = true
}

output "azure_tenant_id" {
  value     = var.tenant_id
  sensitive = true
}


