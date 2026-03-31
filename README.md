# terraform-az-fk-vnet-peering

This repository contains a reusable **Terraform/OpenTofu module** and progressive examples for configuring **Azure VNet Peering** between Virtual Networks.

It is part of the **[FoggyKitchen.com training ecosystem](https://foggykitchen.com/courses/azure-fundamentals-terraform-course/)** and provides a practical, composable building block for Azure networking architectures.

---

## 🎯 Purpose

The goal of this module is to provide a **clean, reusable, and educational reference implementation** for Azure VNet peering:

- Bidirectional peering between two VNets
- Optional forwarded traffic and gateway-related settings
- Predictable naming and simple outputs for composition with other modules

This is **not** a full landing zone framework. It is a focused networking module for learning and real-world reuse.

---

## ✨ What the module does

The module creates:

- `azurerm_virtual_network_peering` from VNet 1 to VNet 2
- `azurerm_virtual_network_peering` from VNet 2 to VNet 1
- Configurable peering options:
  - `allow_virtual_network_access`
  - `allow_forwarded_traffic`
  - `allow_gateway_transit`
  - `use_remote_gateways`

The module intentionally does **not** create:
- Virtual Networks
- Subnets
- NSGs
- Route Tables
- Azure Firewall or Bastion

Use this module together with dedicated VNet/subnet modules.

---

## 📂 Repository Structure

```bash
terraform-az-fk-vnet-peering/
├── examples/
│   ├── 01_basic_peering/
│   ├── 02_hub_spoke_peering/
│   └── README.md
├── inputs.tf
├── main.tf
├── outputs.tf
├── versions.tf
├── LICENSE
└── README.md
```

All examples are runnable and demonstrate practical peering scenarios from basic connectivity to hub-and-spoke topology.

---

## 🚀 Example Usage

```hcl
module "vnet_peering" {
  source = "github.com/mlinxfeld/terraform-az-fk-vnet-peering"

  resource_group_name = "fk-rg"

  vnet_1_id   = module.vnet_hub.vnet_id
  vnet_1_name = module.vnet_hub.vnet_name
  vnet_2_id   = module.vnet_spoke1.vnet_id
  vnet_2_name = module.vnet_spoke1.vnet_name

  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false

  tags = {
    project = "foggykitchen"
    env     = "dev"
  }
}
```

---

## ⚙️ Module Inputs

| Variable | Type | Required | Description |
|--------|------|----------|-------------|
| `resource_group_name` | `string` | ✅ | Resource Group containing both VNets |
| `vnet_1_id` | `string` | ✅ | ID of the first VNet |
| `vnet_2_id` | `string` | ✅ | ID of the second VNet |
| `vnet_1_name` | `string` | ✅ | Name of the first VNet |
| `vnet_2_name` | `string` | ✅ | Name of the second VNet |
| `allow_virtual_network_access` | `bool` | ❌ | Allow access between peered VNets (default: `true`) |
| `allow_forwarded_traffic` | `bool` | ❌ | Allow forwarded traffic (default: `true`) |
| `allow_gateway_transit` | `bool` | ❌ | Allow gateway transit (default: `false`) |
| `use_remote_gateways` | `bool` | ❌ | Use remote gateways (default: `false`) |
| `tags` | `map(string)` | ❌ | Tags applied to peering resources |

---

## 📤 Outputs

| Output | Description |
|------|-------------|
| `peering_1_to_2_id` | ID of peering from VNet 1 to VNet 2 |
| `peering_2_to_1_id` | ID of peering from VNet 2 to VNet 1 |
| `peering_1_to_2_name` | Name of peering from VNet 1 to VNet 2 |
| `peering_2_to_1_name` | Name of peering from VNet 2 to VNet 1 |

---

## 🧩 Examples Overview

| Example | Description |
|-------|-------------|
| `01_basic_peering` | Minimal bidirectional peering between two VNets |
| `02_hub_spoke_peering` | Hub-and-spoke layout with hub-to-spoke peerings |

See [`examples/`](examples) for details.

---

## 🧠 Design Notes

- VNet peering is **non-transitive**
- CIDR ranges must not overlap
- Traffic stays on Microsoft backbone
- Gateway-related settings require consistent configuration on both sides

---

## 🧩 Related Modules & Training

- [terraform-az-fk-vnet](https://github.com/mlinxfeld/terraform-az-fk-vnet)
- [terraform-az-fk-nsg](https://github.com/mlinxfeld/terraform-az-fk-nsg)
- [terraform-az-fk-loadbalancer](https://github.com/mlinxfeld/terraform-az-fk-loadbalancer)
- [terraform-az-fk-compute](https://github.com/mlinxfeld/terraform-az-fk-compute)
- [terraform-az-fk-aks](https://github.com/mlinxfeld/terraform-az-fk-aks)

---

## 🪪 License

Licensed under the **Universal Permissive License (UPL), Version 1.0**.
See [LICENSE](LICENSE) for details.

---

© 2026 [FoggyKitchen.com](https://foggykitchen.com/courses-2/) - *Cloud. Code. Clarity.*
