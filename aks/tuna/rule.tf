resource "azurerm_role_assignment" "example1" {
  scope                = var.agw_subnet_id
  role_definition_name = "Network Contributor"
  principal_id         = azurerm_kubernetes_cluster.res-0.ingress_application_gateway[0].ingress_application_gateway_identity[0].object_id
}

# resource "azurerm_role_assignment" "acr" {
#   principal_id                     = azurerm_kubernetes_cluster.res-0.kubelet_identity[0].object_id
#   role_definition_name             = "AcrPull"
#   scope                            = var.attached_acr_id
#   skip_service_principal_aad_check = true
# }
