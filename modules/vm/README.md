# Azure Virtual Machine Module

## Overview

This Terraform module provisions an Azure Linux Virtual Machine and its required networking resources.

The module is designed to be reusable across multiple Azure environments while following Infrastructure as Code (IaC) and Azure security best practices.

---

## Features

- Creates an Azure Linux Virtual Machine
- Creates a Public IP Address
- Creates a Network Interface (NIC)
- Enables SSH key authentication
- Disables password authentication
- Enables System Assigned Managed Identity
- Applies common tags to all resources

---

## Resources Created

- Azure Linux Virtual Machine
- Azure Network Interface
- Azure Public IP Address

---

## Usage

```hcl
module "vm" {

  source = "../../modules/vm"

  resource_group_name = "rg-dev"

  location = "eastus"

  vm_name = "vm-dev"

  vm_size = "Standard_B2s"

  admin_username = "azureuser"

  ssh_public_key = file("~/.ssh/id_rsa.pub")

  subnet_id = module.vnet.subnet_ids["vm"]

  tags = {
    Environment = "dev"
    ManagedBy   = "Terraform"
  }

}
```

---

## Design Decisions

- Resource Groups are managed outside this module.
- SSH key authentication is used instead of passwords.
- Password authentication is disabled.
- Ubuntu 24.04 LTS is used as the operating system.
- A Standard Static Public IP is created for remote access.
- A System Assigned Managed Identity is enabled to avoid storing credentials on the VM.
- The module exposes only the outputs commonly required by downstream modules.

---

## Security Considerations

The module follows Azure security best practices by:

- Disabling password authentication
- Using SSH public key authentication
- Enabling Managed Identity
- Using Standard SKU Public IP
- Applying consistent resource tagging

---

## Future Enhancements

Possible future improvements include:

- Availability Zones
- Availability Sets
- Boot Diagnostics
- Azure Bastion Support
- Data Disks
- Custom Images
- Cloud-Init Support
- Azure Backup Integration
- Azure Monitor Agent

---

## Testing

Validate the module using:

```bash
terraform fmt
terraform validate
terraform test
```

---

<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->