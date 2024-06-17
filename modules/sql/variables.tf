variable "resource_group_name" {
  description = "resource group name"
  type        = string
}

variable "location" {
  description = "location for the resources"
  type        = string
}

variable "sql_server_name" {
  description = "Name of the SQL Server"
  type        = string
  default     = "example-sql-server"
}

variable "sql_database_name" {
  description = "Name of the SQL Database"
  type        = string
  default     = "example-db"
}

variable "sql_admin_username" {
  description = "Administrator username for the SQL Server"
  type        = string
  default     = "sqladmin"
}

variable "sql_admin_password" {
  description = "Administrator password for the SQL Server"
  type        = string
  default     = "ComplexPassword123!"
}