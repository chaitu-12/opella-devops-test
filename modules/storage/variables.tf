variable "resource_group_name" {
  description = "The name of the Resource Group where the Storage Account will be created."
  type        = string
}
variable "location" {
  description = "Azure region where the Storage Account will be deployed."
  type        = string
}
variable "storage_account_name" {
  description = "Globally unique name for the Azure Storage Account."
  type        = string

  validation {
    condition = (
      length(var.storage_account_name) >= 3 &&
      length(var.storage_account_name) <= 24 &&
      can(regex("^[a-z0-9]+$", var.storage_account_name))
    )
    error_message = "Storage account name must be 3-24 characters long and contain only lowercase letters and numbers."
  }
}
variable "account_replication_type" {
  description = "Replication type for the Storage Account."
  type        = string
  default     = "LRS"

  validation {
    condition = contains(
      ["LRS", "GRS", "RAGRS", "ZRS", "GZRS", "RAGZRS"],
      var.account_replication_type
    )
    error_message = "Replication type must be one of: LRS, GRS, RAGRS, ZRS, GZRS, RAGZRS."
  }
}
variable "container_name" {
  description = "Blob container name."
  type        = string
}
variable "tags" {
  description = "Tags applied to all resources."

  type = map(string)

  default = {}
}