output "storage_account_id" {
  description = "The ID of the Storage Account."
  value       = azurerm_storage_account.this.id
}
output "storage_account_name" {
  description = "The name of the Storage Account."
  value       = azurerm_storage_account.this.name
}
output "primary_blob_endpoint" {
  description = "Primary Blob endpoint."
  value       = azurerm_storage_account.this.primary_blob_endpoint
}
output "container_name" {
  description = "Blob container name."
  value       = azurerm_storage_container.this.name
}