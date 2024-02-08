# Create azure container registry private endpoint
resource "azurerm_private_dns_zone" "acr_private_dns_zone" {
  name                = "privatelink.azurecr.io"
  resource_group_name =  var.resource_group_name
}

# Create azure private dns zone virtual network link for acr private endpoint vnet
resource "azurerm_private_dns_zone_virtual_network_link" "acr_private_dns_zone_virtual_network_link" {
  name                  = "private-dns-zone-vnet-link"
  private_dns_zone_name = azurerm_private_dns_zone.acr_private_dns_zone.name
  resource_group_name   = var.resource_group_name
  virtual_network_id    = var.vnet_id
  #tags                  = var.tags
}

# Create azure private endpoint
resource "azurerm_private_endpoint" "acr_private_endpoint" {
  name                = "private-endpoint"
  resource_group_name = var.resource_group_name
  location            = var.location
  subnet_id           = var.private_endpoint_Subnet
  #tags                = var.tags
  
  private_service_connection {
    name                           = "service-connection"
    private_connection_resource_id = var.acr_id
    is_manual_connection           = false
    subresource_names = [
      "registry"
    ]
  }
  
  private_dns_zone_group {
    name = "private-dns-zone-group"
    
    private_dns_zone_ids = [
      azurerm_private_dns_zone.acr_private_dns_zone.id
    ]  
  }
 
  /*depends_on = [
    #azurerm_virtual_network.acr_private_endpoint_vnet,
    #azurerm_subnet.acr_private_endpoint_subnet,
    #azurerm_container_registry.acr
  ]*/
}
