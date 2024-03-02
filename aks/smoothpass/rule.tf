resource "azurerm_role_assignment" "smoothpass-ingress-subnet-join" {
  scope                = var.agw_subnet_id
  role_definition_name = "Network Contributor"
  principal_id         = azurerm_kubernetes_cluster.smoothpass.ingress_application_gateway[0].ingress_application_gateway_identity[0].object_id
}

resource "azurerm_role_assignment" "smoothpass-acr-pull" {
  principal_id                     = azurerm_kubernetes_cluster.smoothpass.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = var.attached_acr_id
  skip_service_principal_aad_check = true
}
