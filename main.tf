provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}

# resource group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

module "network" {
  source              = "./modules/network"
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "vm" {
  source              = "./modules/vm"
  resource_group_name = var.resource_group_name
  location            = var.location
  subnet_id           = module.network.subnet_id
  vm_name             = var.vm_name
  admin_username      = var.admin_username
  ssh_public_key_path = var.ssh_public_key_path
}

module "storage" {
  source              = "./modules/storage"
  resource_group_name = var.resource_group_name
  location            = var.location
  #storage_account_name = var.storage_account_name
}

module "aks" {
  source              = "./modules/aks"
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "sql" {
  source              = "./modules/sql"
  resource_group_name = var.resource_group_name
  location            = var.location
  sql_server_name     = var.sql_server_name
  sql_database_name   = var.sql_database_name
  sql_admin_username  = var.sql_admin_username
  sql_admin_password  = var.sql_admin_password
}


/*
# AKS Cluster
resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = "my-aks-cluster"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "myakscluster"
  kubernetes_version  = "1.21.4"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  network_profile {
    network_plugin = "azure"
    service_cidr   = "10.0.2.0/24"
    dns_service_ip = "10.0.2.10"
    docker_bridge_cidr = "172.17.0.1/16"

    load_balancer_sku = "standard"

    # Private AKS Configuration
    load_balancer_profile {
      outbound_ip_prefixes = ["*"]
      outbound_ip_prefixes_non_masquerade = []
    }

    private_cluster_enabled = true
    private_dns_zone_id     = azurerm_private_dns_zone.private_dns.id
  }

  addon_profile {
    oms_agent {
      enabled                    = false
    }
  }

  identity {
    type = "SystemAssigned"
  }
}

# Private DNS Zone for AKS Private Endpoint
resource "azurerm_private_dns_zone" "private_dns" {
  name                = "privatelink.azure.com"
  resource_group_name = var.resource_group_name
}

# Private DNS Zone Linking
resource "azurerm_private_dns_zone_virtual_network_link" "private_dns_link" {
  name                  = "aks-private-dns-link"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.private_dns.name
  virtual_network_id    = var.
}
*/