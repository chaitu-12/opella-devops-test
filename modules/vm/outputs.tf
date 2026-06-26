output "vm_id" {
  description = "The Virtual Machine ID."

  value = azurerm_linux_virtual_machine.this.id
}

output "vm_name" {
  description = "The Virtual Machine name."

  value = azurerm_linux_virtual_machine.this.name
}

output "public_ip_address" {
  description = "Public IP address."

  value = azurerm_public_ip.this.ip_address
}

output "private_ip_address" {
  description = "Private IP address."

  value = azurerm_network_interface.this.private_ip_address
}