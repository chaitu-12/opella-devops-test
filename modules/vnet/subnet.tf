resource "azurerm_subnet" "this" {

  for_each = var.subnets

  name                 = each.key
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.this.name

  address_prefixes = each.value.address_prefixes

  service_endpoints = each.value.service_endpoints
}