resource "azurerm_resource_group" "fk_rg" {
  name     = var.resource_group_name
  location = var.resource_group_location
}
