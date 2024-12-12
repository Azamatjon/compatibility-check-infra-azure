# resource-group.tf
resource "azurerm_resource_group" "main" {
  name     = "ai-roomiecheck"
  location = var.location
}
