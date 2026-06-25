resource "azurerm_network_security_group" "this" {

  for_each = var.create_nsg ? var.subnets : {}

  name                = "${each.key}-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = local.tags
}

resource "azurerm_network_security_rule" "this" {

  for_each = var.create_nsg ? local.expanded_nsg_rules : {}

  name      = each.value.rule.name
  priority  = each.value.rule.priority
  direction = each.value.rule.direction
  access    = each.value.rule.access
  protocol  = each.value.rule.protocol

  source_port_range      = each.value.rule.source_port_range
  destination_port_range = each.value.rule.destination_port_range

  source_address_prefix      = each.value.rule.source_address_prefix
  destination_address_prefix = each.value.rule.destination_address_prefix

  resource_group_name = var.resource_group_name

  network_security_group_name = azurerm_network_security_group.this[
    each.value.subnet
  ].name

}

resource "azurerm_subnet_network_security_group_association" "this" {

  for_each = var.create_nsg ? var.subnets : {}

  subnet_id = azurerm_subnet.this[each.key].id

  network_security_group_id = azurerm_network_security_group.this[each.key].id
}