variable "resource_group_location" {
  type        = string
  description = "Azure region for the resource group."
  default     = "westeurope"
}

variable "vnet_1_location" {
  type        = string
  description = "Azure region for the first VNet."
  default     = "westeurope"
}

variable "vnet_2_location" {
  type        = string
  description = "Azure region for the second VNet."
  default     = "northeurope"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name."
  default     = "fk-rg"
}
