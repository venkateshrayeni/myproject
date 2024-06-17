/*
output "vm_id" {
  description = "The ID of the virtual machine"
  value       = azurerm_linux_virtual_machine.example.id
}

output "storage_account_id" {
  description = "The ID of the storage account"
  value       = azurerm_storage_account.example.id
}

output "disk_id" {
  description = "The ID of the managed disk"
  value       = azurerm_managed_disk.example.id
}

output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "aks_cluster_kube_config" {
  value = azurerm_kubernetes_cluster.aks.kube_config_raw
}

output "sql_server_fqdn" {
  value = azurerm_sql_server.sql_server.fully_qualified_domain_name
}

output "hello_world_service_ip" {
  value = kubernetes_service.hello_world.load_balancer_ingress[0].ip
}
*/
output "sql_server_name" {
  value = module.sql.sql_server_name
}

output "sql_database_connection_string" {
  value = module.sql.sql_database_connection_string
}
