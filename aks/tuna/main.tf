resource "azurerm_kubernetes_cluster" "res-0" {
  azure_policy_enabled                = true
  dns_prefix                          = "tuna"
  location                            = var.location
  name                                = "tuna"
  private_cluster_enabled             = true
  private_cluster_public_fqdn_enabled = true
  resource_group_name                 = var.resource_group_name
  sku_tier                            = "Standard"

  default_node_pool {
    enable_auto_scaling = true
    max_count           = 2
    min_count           = 1
    name                = "agentpool1"
    type                = "VirtualMachineScaleSets"
    vm_size             = "Standard_DS2_v2"
    pod_subnet_id       = var.pod_subnet_id
    vnet_subnet_id      = var.vnet_subnet_id
    zones               = ["1", "3"]
  }

  network_profile {
    network_plugin     = "azure"
    network_policy     = "azure"
    load_balancer_sku  = "standard"
    service_cidr = "10.2.80.0/20"
    dns_service_ip = "10.2.80.10"
  }

  identity {
    type = "SystemAssigned"
  }

#   monitor_metrics {
#   }

  ingress_application_gateway {
    gateway_id = var.agw_id
  } 
}

resource "azurerm_role_assignment" "example1" {
  scope                = var.agw_subnet_id
  role_definition_name = "Network Contributor"
  principal_id         = azurerm_kubernetes_cluster.res-0.ingress_application_gateway[0].ingress_application_gateway_identity[0].object_id
}
