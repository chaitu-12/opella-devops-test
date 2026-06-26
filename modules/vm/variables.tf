variable "resource_group_name" {
  description = "The name of the Resource Group."
  type        = string
}
variable "location" {
  description = "Azure region where the VM will be deployed."
  type        = string
}
variable "vm_name" {
  description = "Virtual Machine name."
  type        = string
}
variable "vm_size" {
  description = "Azure Virtual Machine size."
  type        = string
  default     = "Standard_B2s"
}
variable "admin_username" {
  description = "Administrator username."
  type        = string
}
variable "ssh_public_key" {
  description = "SSH public key."
  type        = string
}
variable "subnet_id" {
  description = "Subnet ID where the VM NIC will be deployed."
  type        = string
}
variable "tags" {
  description = "Tags applied to all resources."
  type        = map(string)
  default     = {}
}