output "vnet_id" {
  description = "The ID of the Virtual Network."

  value = azurerm_virtual_network.this.id
}
output "vnet_name" {
  description = "The name of the Virtual Network."

  value = azurerm_virtual_network.this.name
}
output "subnet_ids" {
  description = "Map of subnet IDs."

  value = {
    for subnet_name, subnet in azurerm_subnet.this :
    subnet_name => subnet.id
  }
}
output "subnet_names" {
  description = "Map of subnet names."

  value = {
    for subnet_name, subnet in azurerm_subnet.this :
    subnet_name => subnet.name
  }
}
output "nsg_ids" {
  description = "Map of Network Security Group IDs."

  value = {
    for nsg_name, nsg in azurerm_network_security_group.this :
    nsg_name => nsg.id
  }
}