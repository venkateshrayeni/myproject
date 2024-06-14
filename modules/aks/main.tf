resource "azurerm_kubernetes_cluster" "aks" {
  name                = "myaks"
  location            = var.location
  resource_group_name = var.resource_group_name
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