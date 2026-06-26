resource "azurerm_storage_account" "this" {

  name                = var.storage_account_name
  resource_group_name = var.resource_group_name
  location            = var.location

  account_tier             = local.account_tier
  account_replication_type = var.account_replication_type

  account_kind = "StorageV2"

  https_traffic_only_enabled = true
  min_tls_version            = "TLS1_2"

  allow_nested_items_to_be_public = false

  tags = local.tags
}
resource "azurerm_storage_container" "this" {

  name               = var.container_name
  storage_account_id = azurerm_storage_account.this.id

  container_access_type = "private"

}