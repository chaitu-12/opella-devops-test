#############################################
# Resource Group
#############################################

output "resource_group_name" {
  description = "Resource Group name."

  value = azurerm_resource_group.this.name
}

#############################################
# Virtual Network
#############################################

output "vnet_name" {
  description = "Virtual Network name."

  value = module.vnet.vnet_name
}

#############################################
# Virtual Machine
#############################################

output "vm_name" {
  description = "Virtual Machine name."

  value = module.vm.vm_name
}

output "vm_public_ip" {
  description = "Public IP address of the Virtual Machine."

  value = module.vm.public_ip_address
}

#############################################
# Storage
#############################################

output "storage_account_name" {
  description = "Storage Account name."

  value = module.storage.storage_account_name
}