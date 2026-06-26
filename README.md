## Overview

This repository demonstrates the provisioning of Azure infrastructure using **Terraform** following Infrastructure as Code (IaC) best practices.

The solution emphasizes:

- Reusable Terraform modules
- Secure-by-default Azure resources
- Clean project structure
- Environment-based deployments
- Modular and maintainable code
- CI/CD using Jenkins

The infrastructure is designed to support multiple environments while minimizing code duplication.

---

# Solution Architecture

```
                    Azure Subscription
                           │
                    Resource Group
                           │
        ┌──────────────────┼──────────────────┐
        │                  │                  │
        ▼                  ▼                  ▼
     VNet Module      Storage Module      VM Module
        │                  │                  │
        │                  │                  │
     Azure VNet      Storage Account    Linux VM
        │                  │                  │
     Subnets         Blob Container     Public IP
        │                                 │
     NSGs                           Network Interface
```

---

# Repository Structure

```
opella-devops-test/
│
├── environments/
│   └── dev/
│       ├── backend.tf
│       ├── main.tf
│       ├── outputs.tf
│       ├── providers.tf
│       ├── terraform.tfvars
│       ├── variables.tf
│       └── versions.tf
│
├── modules/
│   ├── storage/
│   ├── vm/
│   └── vnet/
│
├── Jenkinsfile
├── README.md
└── .gitignore
```

---

# Modules

## VNet Module

Creates:

- Azure Virtual Network
- Subnets
- Network Security Groups
- NSG Associations

Features:

- Dynamic subnet creation using `for_each`
- Optional NSG deployment
- Dynamic NSG rules
- Service Endpoints
- Common tagging

---

## Storage Module

Creates:

- Azure Storage Account
- Private Blob Container

Security features:

- HTTPS Only
- TLS 1.2
- Public Blob Access Disabled

---

## VM Module

Creates:

- Azure Linux Virtual Machine
- Network Interface
- Public IP Address

Security features:

- SSH Key Authentication
- Password Authentication Disabled
- System Assigned Managed Identity

---

# Design Decisions

## Why Modules?

The infrastructure is split into reusable modules to:

- Reduce code duplication
- Improve maintainability
- Promote reusability across environments
- Simplify future enhancements

---

## Why Resource Groups Instead of Separate Subscriptions?

For this assessment, a single Azure subscription with separate Resource Groups is sufficient because:

- Lower administrative overhead
- Simpler deployment
- Supports environment isolation
- Easy migration to separate subscriptions in the future

In an enterprise environment, Production would typically reside in a dedicated Azure Subscription.

---

## Security

The infrastructure follows secure defaults including:

- HTTPS Only Storage Accounts
- TLS 1.2
- Private Blob Containers
- SSH Key Authentication
- Managed Identity
- Network Security Groups
- Consistent Resource Tagging

---

# Prerequisites

Install:

- Terraform >= 1.5
- Azure CLI
- Git
- Jenkins (for CI/CD)

Authenticate to Azure:

```bash
az login
```

Verify the subscription:

```bash
az account show
```

---

# Deployment

Navigate to the development environment:

```bash
cd environments/dev
```

Initialize Terraform:

```bash
terraform init
```

Validate:

```bash
terraform validate
```

Format:

```bash
terraform fmt -recursive
```

Generate a plan:

```bash
terraform plan
```

Deploy:

```bash
terraform apply
```

Destroy:

```bash
terraform destroy
```

---

# CI/CD

The repository includes a Jenkins pipeline that performs:

- Checkout
- Terraform Format Check
- Terraform Validate
- TFLint
- tfsec
- Terraform Init
- Terraform Plan
- Manual Approval
- Terraform Apply

---

# Code Quality

The project follows Terraform best practices and can be validated using:

```bash
terraform fmt -recursive
terraform validate
terraform plan
```

Recommended tools:

- terraform-docs
- tflint
- tfsec
- pre-commit

---

# Future Improvements

Potential enhancements include:

- Multiple Azure environments (Dev, Test, Prod)
- Remote Terraform Backend
- Azure Key Vault integration
- Azure Monitor
- Log Analytics Workspace
- Private Endpoints
- Route Tables
- DDoS Protection
- Azure Bastion
- Automated Terraform Tests

---
