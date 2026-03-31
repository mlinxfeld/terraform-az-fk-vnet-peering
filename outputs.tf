output "peering_1_to_2_id" {
  description = "ID of peering from VNet 1 to VNet 2"
  value       = azurerm_virtual_network_peering.vnet_1_to_2.id
}

output "peering_2_to_1_id" {
  description = "ID of peering from VNet 2 to VNet 1"
  value       = azurerm_virtual_network_peering.vnet_2_to_1.id
}

output "peering_1_to_2_name" {
  description = "Name of peering from VNet 1 to VNet 2"
  value       = azurerm_virtual_network_peering.vnet_1_to_2.name
}

output "peering_2_to_1_name" {
  description = "Name of peering from VNet 2 to VNet 1"
  value       = azurerm_virtual_network_peering.vnet_2_to_1.name
}