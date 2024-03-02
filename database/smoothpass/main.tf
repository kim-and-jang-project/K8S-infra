resource "azurerm_mysql_flexible_server" "smoothpass" {
  name                   = "smoothpass"
  resource_group_name    = var.resource_group_name
  location               = var.location
  administrator_login    = var.administrator_login
  administrator_password = var.administrator_password
  backup_retention_days  = 7
  delegated_subnet_id    = var.delegated_subnet_id
  private_dns_zone_id    = azurerm_private_dns_zone.smoothpass.id
  sku_name               = "B_Standard_B1ms"
  zone                   = 1
  version                = "8.0.21"
  depends_on = [azurerm_private_dns_zone_virtual_network_link.kimandjang-smoothpass-dns-k8s-network]
}

resource "azurerm_private_dns_zone" "smoothpass" {
  name                = "kimandjang.mysql.database.azure.com"
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "kimandjang-smoothpass-dns-k8s-network" {
  name                  = "kimandjang-dns-link"
  private_dns_zone_name = azurerm_private_dns_zone.smoothpass.name
  virtual_network_id    = var.virtual_network_id
  resource_group_name   = var.resource_group_name
}
