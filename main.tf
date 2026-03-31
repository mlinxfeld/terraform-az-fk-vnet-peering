locals {
  peering_1_to_2_name = "${var.vnet_1_name}-to-${var.vnet_2_name}"
  peering_2_to_1_name = "${var.vnet_2_name}-to-${var.vnet_1_name}"
}

resource "azurerm_virtual_network_peering" "vnet_1_to_2" {
  name                      = local.peering_1_to_2_name
  resource_group_name       = var.resource_group_name
  virtual_network_name      = var.vnet_1_name
  remote_virtual_network_id = var.vnet_2_id

  allow_virtual_network_access = var.allow_virtual_network_access
  allow_forwarded_traffic      = var.allow_forwarded_traffic
  allow_gateway_transit        = var.allow_gateway_transit
  use_remote_gateways          = var.use_remote_gateways

}

resource "azurerm_virtual_network_peering" "vnet_2_to_1" {
  name                      = local.peering_2_to_1_name
  resource_group_name       = var.resource_group_name
  virtual_network_name      = var.vnet_2_name
  remote_virtual_network_id = var.vnet_1_id

  allow_virtual_network_access = var.allow_virtual_network_access
  allow_forwarded_traffic      = var.allow_forwarded_traffic

  # Important constraint:
  # If one side uses remote gateways, the other must allow gateway transit
  allow_gateway_transit = var.use_remote_gateways
  use_remote_gateways   = var.allow_gateway_transit

}