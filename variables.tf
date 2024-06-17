variable "subscription_id" {
  description = "The subscription ID for Azure"
  type        = string
}

variable "client_id" {
  description = "The client ID of the service principal"
  type        = string
}

variable "client_secret" {
  description = "The client secret of the service principal"
  type        = string
}

variable "tenant_id" {
  description = "The tenant ID for Azure"
  type        = string
}

variable "resource_group_name" {
  description = "resource group name"
  type        = string
}

variable "location" {
  description = "location for the resources"
  type        = string
  default     = "East US"
}

variable "vm_name" {
    description = "name of vm"
    type = string
}

variable "admin_username" {
  description = "The admin username for the VM"
  type        = string
}

variable "ssh_public_key_path" {
  description = "The path to the SSH public key"
  type        = string
}

/*
variable "storage_account_name" {
  description = "storage account name"
  type        = string
}
*/

variable "sql_server_name" {
  description = "Name of the SQL Server"
  type        = string
}

variable "sql_database_name" {
  description = "Name of the SQL Database"
  type        = string
}

variable "sql_admin_username" {
  description = "Administrator username for the SQL Server"
  type        = string
}

variable "sql_admin_password" {
  description = "Administrator password for the SQL Server"
  type        = string
}