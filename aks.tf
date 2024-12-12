resource "azurerm_subnet" "k8s_subnet" {
  name                 = "k8s-subnet"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main_vnet.name
  address_prefixes     = ["10.0.4.0/24"]
}

## Azure Kubernetes Cluster (AKS)
resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  dns_prefix          = "aks"
  sku_tier            = "Standard"
  automatic_upgrade_channel = "stable"
  oidc_issuer_enabled    = true
  workload_identity_enabled = true

  default_node_pool {
    name                = "default"
    node_count = 1
    min_count           = 1
    max_count           = 5
    vm_size             = "Standard_DS2_v2"

    auto_scaling_enabled = true
    type = "VirtualMachineScaleSets"

    node_labels = {
      role = "main"
    }

    # Use the existing subnet
    vnet_subnet_id = azurerm_subnet.k8s_subnet.id
  }

  identity {
    type = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.user_aid.id]
  }

  network_profile {
    network_plugin = "azure"
    load_balancer_sku = "standard"
    service_cidr = "10.0.3.0/24"
    dns_service_ip = "10.0.3.10"
  }

  depends_on = [
    azurerm_role_assignment.network_contributor
  ]

  lifecycle {
    ignore_changes = [default_node_pool[0].node_count, default_node_pool[0].upgrade_settings]
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "f4sv2" {
  name                = "f4sv2"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  vm_size             = "Standard_F4s_v2"
  node_count          = 1
  min_count           = 1
  max_count           = 3
  auto_scaling_enabled = true

  vnet_subnet_id = azurerm_subnet.k8s_subnet.id

  node_labels = {
    role = "f4sv2"
  }

  node_taints = [
    "f4sv2=true:NoSchedule"
  ]
}

resource "azurerm_user_assigned_identity" "user_aid" {
  name                = "aks-identity"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
}

# Role Assignment to Link AKS with ACR
resource "azurerm_role_assignment" "aks_acr_role" {
  principal_id         = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
  role_definition_name = "AcrPull"
  scope                = azurerm_container_registry.acr.id
}

resource "azurerm_role_assignment" "network_contributor" {
  scope                = azurerm_resource_group.main.id
  role_definition_name = "Network Contributor"
  principal_id         = azurerm_user_assigned_identity.user_aid.principal_id
}

# Output Kubernetes configuration
output "kube_config" {
  value     = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive = true
}
