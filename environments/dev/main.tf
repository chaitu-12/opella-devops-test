#############################################
# Resource Group
#############################################

resource "azurerm_resource_group" "this" {

  name     = var.resource_group_name
  location = var.location

}

#############################################
# Common Tags
#############################################

locals {

  tags = {

    Environment = var.environment
    ManagedBy   = "Terraform"
    Project     = "Opella DevOps Assessment"

  }

}

#############################################
# Random String for Storage Account
#############################################

resource "random_string" "storage_suffix" {

  length  = 4
  upper   = false
  lower   = true
  numeric = true
  special = false

}

#############################################
# VNet Module
#############################################

module "vnet" {

  source = "../../modules/vnet"

  resource_group_name = azurerm_resource_group.this.name

  location = var.location

  vnet_name = "vnet-${var.environment}"

  address_space = [
    "10.0.0.0/16"
  ]

  subnets = {

    app = {

      address_prefixes = [
        "10.0.1.0/24"
      ]

      service_endpoints = [
        "Microsoft.Storage"
      ]

    }

    vm = {

      address_prefixes = [
        "10.0.2.0/24"
      ]

      service_endpoints = []

    }

  }

  create_nsg = true

  nsg_rules = [

    {
      name                       = "AllowSSH"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }

  ]

  tags = local.tags

}

#############################################
# Storage Module
#############################################

module "storage" {

  source = "../../modules/storage"

  resource_group_name = azurerm_resource_group.this.name

  location = var.location

  storage_account_name = "opellast${var.environment}${random_string.storage_suffix.result}"

  container_name = "artifacts"

  account_replication_type = "LRS"

  tags = local.tags

}

#############################################
# Virtual Machine Module
#############################################

module "vm" {

  source = "../../modules/vm"

  resource_group_name = azurerm_resource_group.this.name

  location = var.location

  vm_name = "vm-${var.environment}"

  vm_size = "Standard_B2s"

  admin_username = "azureuser"

  ssh_public_key = file(var.ssh_public_key)

  subnet_id = module.vnet.subnet_ids["vm"]

  tags = local.tags

}