resource "azurerm_public_ip" "this" {

  name                = "${var.vm_name}-pip"
  location            = var.location
  resource_group_name = var.resource_group_name

  allocation_method = "Static"
  sku               = "Standard"

  tags = local.tags
}
resource "azurerm_network_interface" "this" {

  name                = "${var.vm_name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {

    name = "primary"

    subnet_id = var.subnet_id

    private_ip_address_allocation = "Dynamic"

    public_ip_address_id = azurerm_public_ip.this.id

  }

  tags = local.tags
}