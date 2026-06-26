# Azure Storage Module

## Overview

This Terraform module provisions an Azure Storage Account and a Blob Storage Container.

The module is designed to be reusable across different Azure environments while following security best practices and Infrastructure as Code (IaC) principles.

---

## Features

- Creates an Azure Storage Account
- Creates a private Blob Storage Container
- Enforces HTTPS-only traffic
- Uses TLS 1.2
- Disables public blob access
- Applies common tags to all resources

---

## Resources Created

- Azure Storage Account
- Azure Blob Storage Container

---

## Usage

```hcl
module "storage" {

  source = "../../modules/storage"

  resource_group_name = "rg-dev"

  location = "eastus"

  storage_account_name = "storagedev12345"

  container_name = "artifacts"

  account_replication_type = "LRS"

  tags = {
    Environment = "dev"
    ManagedBy   = "Terraform"
  }

}