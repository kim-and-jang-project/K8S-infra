output "vnet_subnet_id" {
  value = azurerm_subnet.subnet5.id
}

output "pod_subnet_id" {
  value = azurerm_subnet.subnet6.id
}

output "gateway_subnet_id" {
  value = azurerm_subnet.subnet4.id
}

output "private_endpoint_subnet_id" {
  value = azurerm_subnet.subnet7.id
}

output "vnet_id" {
  value = azurerm_virtual_network.example.id
}

output "private_db_subnet_id" {
  value = azurerm_subnet.subnet8.id
}
