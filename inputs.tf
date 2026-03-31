variable "resource_group_name" {
  description = "Name of the resource group where VNet peering will be created"
  type        = string
}

variable "vnet_1_id" {
  description = "ID of the first Virtual Network"
  type        = string
}

variable "vnet_2_id" {
  description = "ID of the second Virtual Network"
  type        = string
}

variable "vnet_1_name" {
  description = "Name of the first Virtual Network"
  type        = string
}

variable "vnet_2_name" {
  description = "Name of the second Virtual Network"
  type        = string
}

variable "allow_virtual_network_access" {
  description = "Allow access between VNets"
  type        = bool
  default     = true
}

variable "allow_forwarded_traffic" {
  description = "Allow forwarded traffic (required for hub-spoke scenarios)"
  type        = bool
  default     = true
}

variable "allow_gateway_transit" {
  description = "Allow gateway transit"
  type        = bool
  default     = false
}

variable "use_remote_gateways" {
  description = "Use remote gateways"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}