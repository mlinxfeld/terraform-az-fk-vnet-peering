module "vnet_1" {
  source = "github.com/mlinxfeld/terraform-az-fk-vnet"

  name                = "fk-vnet-region1"
  location            = var.vnet_1_location
  resource_group_name = azurerm_resource_group.fk_rg.name
  address_space       = ["10.10.0.0/16"]

  subnets = {
    fk-subnet-region1 = {
      name             = "fk-subnet-region1"
      address_prefixes = ["10.10.1.0/24"]
    }
  }
}

module "vnet_2" {
  source = "github.com/mlinxfeld/terraform-az-fk-vnet"

  name                = "fk-vnet-region2"
  location            = var.vnet_2_location
  resource_group_name = azurerm_resource_group.fk_rg.name
  address_space       = ["10.20.0.0/16"]

  subnets = {
    fk-subnet-region2 = {
      name             = "fk-subnet-region2"
      address_prefixes = ["10.20.1.0/24"]
    }
  }
}

module "peering" {
  source = "github.com/mlinxfeld/terraform-az-fk-vnet-peering"

  resource_group_name = azurerm_resource_group.fk_rg.name

  vnet_1_id   = module.vnet_1.vnet_id
  vnet_1_name = module.vnet_1.vnet_name

  vnet_2_id   = module.vnet_2.vnet_id
  vnet_2_name = module.vnet_2.vnet_name
}
