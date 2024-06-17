resource "azurerm_kubernetes_cluster" "aks" {
  name                = "myaks"
  resource_group_name = var.resource_group_name
  location            = var.location
  dns_prefix          = "aks1"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "poc"
  }
}

resource "azurerm_container_registry" "acr" {
  name                = "mypocacr379"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Basic"
  admin_enabled       = false
  /*
  georeplications {
    location                = "East US"
    zone_redundancy_enabled = false
    tags                    = {}
  }
  georeplications {
    location                = "North Europe"
    zone_redundancy_enabled = true
    tags                    = {}
  }
  */
}