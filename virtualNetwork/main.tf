resource "azurerm_virtual_network" "example" {
  name                = "myVNet"
  address_space       = ["10.2.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "subnet4" {
  name                 = "kubeApplication_gateway_Subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.2.16.0/20"]
}

resource "azurerm_subnet" "subnet5" {
  name                 = "AKS_Node_subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.2.32.0/20"]
}

resource "azurerm_subnet" "subnet6" {
  name                 = "AKS_Pod_subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.example.name
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

resource "azurerm_subnet" "subnet7" {
  name                 = "private_endpoint_Subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.2.64.0/20"]
}

