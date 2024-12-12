resource "azurerm_container_registry" "acr" {
  name                = "airoomiecheck"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  sku                 = "Basic"
  admin_enabled       = true
}
