# Azure VNet Peering with Terraform/OpenTofu - Training Examples

This directory contains progressive examples for the **terraform-az-fk-vnet-peering** module.
The examples start from **basic two-VNet peering**, expand into **cross-region connectivity**, and then move to a practical **hub-and-spoke peering topology**.

These examples are part of the **[FoggyKitchen.com training ecosystem](https://foggykitchen.com/courses-2/)** and are designed to help you learn Azure networking patterns in a structured way.

---

## 🧭 Example Overview

| Example | Title | Key Topics |
|:-------:|:------|:-----------|
| 01 | **Basic VNet Peering** | Bidirectional peering between two VNets |
| 02 | **Hub-and-Spoke Peering** | Central hub connected to multiple spokes |
| 03 | **Cross-Region Peering** | Bidirectional peering between VNets in different Azure regions |

Each example can be applied independently, but the recommended learning flow is:
**01 -> 03 -> 02**

---

## ⚙️ How to Use

Each example directory contains:
- Terraform/OpenTofu configuration (`.tf`)
- A focused `README.md` explaining the architecture
- Architecture and Azure Portal screenshots

To run an example:

```bash
cd examples/01_basic_peering
tofu init
tofu plan
tofu apply
```

For the second scenario:

```bash
cd examples/02_hub_spoke_peering
tofu init
tofu plan
tofu apply
```

For the third scenario:

```bash
cd examples/03_cross_region_peering
tofu init
tofu plan
tofu apply
```

When finished:

```bash
tofu destroy
```

---

## 🧩 Design Principles

- One example = one clear networking goal
- Minimal, practical topologies without placeholder complexity
- Reusable patterns for real Azure environments
- Clear progression from simple peering to cross-region and hub-and-spoke design

---

## 🧩 Related Resources

- [FoggyKitchen Azure VNet Peering Module (terraform-az-fk-vnet-peering)](../)
- [FoggyKitchen Azure VNet Module (terraform-az-fk-vnet)](https://github.com/mlinxfeld/terraform-az-fk-vnet)
- [FoggyKitchen Azure NSG Module (terraform-az-fk-nsg)](https://github.com/mlinxfeld/terraform-az-fk-nsg)
- [FoggyKitchen Azure Load Balancer Module (terraform-az-fk-loadbalancer)](https://github.com/mlinxfeld/terraform-az-fk-loadbalancer)
- [FoggyKitchen Azure Compute Module (terraform-az-fk-compute)](https://github.com/mlinxfeld/terraform-az-fk-compute)

---

## 🪪 License

Licensed under the **Universal Permissive License (UPL), Version 1.0**.
See [LICENSE](../LICENSE) for details.

---

© 2025 [FoggyKitchen.com](https://foggykitchen.com) - *Cloud. Code. Clarity.*
