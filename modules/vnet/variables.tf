variable "resource_group_name" {
  description = "The name of the Resource Group where the Virtual Network will be created."
  type        = string
}
variable "location" {
  description = "Azure region where the Virtual Network will be deployed."
  type        = string
}
variable "vnet_name" {
  description = "The name of the Virtual Network."
  type        = string

  validation {
    condition     = length(var.vnet_name) >= 3
    error_message = "The VNet name must be at least 3 characters long."
  }
}

variable "address_space" {
  description = "Address space for the Virtual Network."
  type        = list(string)

  validation {
    condition     = length(var.address_space) > 0
    error_message = "At least one address space must be provided."
  }
}

variable "subnets" {

  description = <<EOT
Map of subnets to create.

Example:

subnets = {
  app = {
    address_prefixes = ["10.0.1.0/24"]
    service_endpoints = ["Microsoft.Storage"]
  }

  vm = {
    address_prefixes = ["10.0.2.0/24"]
  }
}
EOT

  type = map(object({

    address_prefixes = list(string)

    service_endpoints = optional(list(string), [])

  }))

  validation {
    condition     = length(var.subnets) > 0
    error_message = "At least one subnet must be defined."
  }
}

variable "create_nsg" {
  description = "Whether to create one Network Security Group for each subnet."

  type = bool

  default = true
}
variable "nsg_rules" {
  description = "Custom NSG rules to apply to each Network Security Group."

  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))

  default = []
}
variable "tags" {
  description = "Tags to apply to all Azure resources."

  type = map(string)

  default = {}
}