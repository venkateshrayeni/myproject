# Output the SQL Server name and the database connection string
output "sql_server_name" {
  value = azurerm_mssql_server.sqlServer.name
}

output "sql_database_connection_string" {
  value = format(
    "Server=tcp:%s.database.windows.net,1433;Database=%s;User ID=%s;Password=%s;Encrypt=true;Connection Timeout=30;",
    azurerm_mssql_server.sqlServer.name,
    azurerm_mssql_database.sqlDb.name,
    var.sql_admin_username,
    var.sql_admin_password
  )
}
