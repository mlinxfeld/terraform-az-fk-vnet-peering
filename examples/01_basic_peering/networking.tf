module "vnet_1" {
  source = "github.com/mlinxfeld/terraform-az-fk-vnet"

  name                = "fk-vnet-1"
  location            = azurerm_resource_group.fk_rg.location
  resource_group_name = azurerm_resource_group.fk_rg.name
  address_space     = ["10.0.0.0/16"]

  subnets = {
    fk-subnet1 = {
      name             = "fk-subnet1"
      address_prefixes = ["10.0.1.0/24"]
    }
  }
}

module "vnet_2" {
  source = "github.com/mlinxfeld/terraform-az-fk-vnet"

  name                = "fk-vnet-2"
  location            = azurerm_resource_group.fk_rg.location
  resource_group_name = azurerm_resource_group.fk_rg.name  
  address_space       = ["10.1.0.0/16"]

  subnets = {
    fk-subnet2 = {
      name             = "fk-subnet2"
      address_prefixes = ["10.1.1.0/24"]
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