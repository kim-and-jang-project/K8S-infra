output "vnet_subnet_id" {
  value = azurerm_subnet.smoothpass-aks-node-subnet.id
}

output "pod_subnet_id" {
  value = azurerm_subnet.smoothpass-aks-system-pod-subnet.id
}

output "gateway_subnet_id" {
  value = azurerm_subnet.smoothpass-aks-agw-subnet.id
}

output "private_endpoint_subnet_id" {
  value = azurerm_subnet.smoothpass-acr-endpoint-subnet.id
}

output "vnet_id" {
  value = azurerm_virtual_network.smoothpass-k8s.id
}

output "private_db_subnet_id" {
  value = azurerm_subnet.smoothpass-db-endpoint-subnet.id
}

output "pod_subnet_id_2" {
  value = azurerm_subnet.smoothpass-aks-user-pod-subnet.id
}

