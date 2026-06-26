variable "subscription_id" {
  description = "Azure Subscription ID."
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group name."
  type        = string
}

variable "location" {
  description = "Azure region."
  type        = string
}

variable "environment" {
  description = "Environment name."
  type        = string
}

variable "ssh_public_key" {
  description = "SSH Public Key."
  type        = string
}