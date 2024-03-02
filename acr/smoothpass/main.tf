resource "azurerm_container_registry" "smoothpass" {
  name                          = var.acr_name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  sku                           = "Premium"
  public_network_access_enabled = false
  zone_redundancy_enabled       = true
  admin_enabled = true
}
