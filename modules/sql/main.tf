# Create a SQL Server
resource "azurerm_mssql_server" "sqlServer" {
  name                         = var.sql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.sql_admin_username
  administrator_login_password = var.sql_admin_password
  public_network_access_enabled = true
/*  
  minimum_tls_version          = "1.2"

  azuread_administrator {
    login_username = "AzureAD Admin"
    object_id      = "00000000-0000-0000-0000-000000000000"
  }

  tags = {
    environment = "poc"
  }
*/  
}

# Create a SQL Database
resource "azurerm_mssql_database" "sqlDb" {
  name           = var.sql_database_name
  server_id      = azurerm_mssql_server.sqlServer.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = 1
  sku_name       = "Basic"
  read_scale     = false
  zone_redundant = false
  enclave_type   = "VBS"

  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = false
  }
}

resource "azurerm_mssql_firewall_rule" "aks" {
  name                = "AllowAksSubnet"
  server_id         = azurerm_mssql_server.sqlServer.id
  # resource_group_name = var.resource_group_name
  # start_ip_address    = cidrhost(azurerm_subnet.aks.address_prefixes[0], 0)
  # end_ip_address      = cidrhost(azurerm_subnet.aks.address_prefixes[0], 255)
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}