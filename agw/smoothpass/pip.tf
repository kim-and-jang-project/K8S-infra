resource "azurerm_public_ip" "smoothpass-ingress-agw" {
  name                = "smoothpass-ingress-agw-ip"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"
  sku                 = "Standard"
  zones		      = ["1","2","3"]
}

