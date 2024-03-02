resource "azurerm_virtual_network" "smoothpass-k8s" {
  name                = var.vnet_name
  address_space       = ["10.2.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "smoothpass-aks-agw-subnet" {
  name                 = "smoothpass-aks-agw-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.smoothpass-k8s.name
  address_prefixes     = ["10.2.16.0/20"]
}

resource "azurerm_subnet" "smoothpass-aks-node-subnet" {
  name                 = "smoothpass-aks-node-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.smoothpass-k8s.name
  address_prefixes     = ["10.2.32.0/20"]
}

resource "azurerm_subnet" "smoothpass-aks-system-pod-subnet" {
  name                 = "smoothpass-aks-system-pod-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.smoothpass-k8s.name
  address_prefixes     = ["10.2.48.0/20"]

  delegation {
    name = "aks-delegation"

    service_delegation {
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
      ] 
      name = "Microsoft.ContainerService/managedClusters"
    }
  }
}

resource "azurerm_subnet" "smoothpass-acr-endpoint-subnet" {
  name                 = "smoothpass-acr-endpoint-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.smoothpass-k8s.name
  address_prefixes     = ["10.2.64.0/20"]
}

resource "azurerm_subnet" "smoothpass-db-endpoint-subnet" {
  name                 = "smoothpass-db-endpoint-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.smoothpass-k8s.name
  address_prefixes     = ["10.2.96.0/20"]

  delegation {
    name = "database-delegation"

    service_delegation {
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action"
      ] 
      name = "Microsoft.DBforMySQL/flexibleServers"
    }
  }
}

resource "azurerm_subnet" "smoothpass-aks-user-pod-subnet" {
  name                 = "smoothpass-aks-user-pod-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.smoothpass-k8s.name
  address_prefixes     = ["10.2.112.0/20"]

  delegation {
    name = "aks-delegation"

    service_delegation {
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
      ]
      name    = "Microsoft.ContainerService/managedClusters"
    }
  }
}


