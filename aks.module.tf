module "tuna" {
  source = "./aks/tuna"
  location = "koreacentral"
  resource_group_name = module.example-rg.name
  pod_subnet_id = module.example-vn.pod_subnet_id
  vnet_subnet_id = module.example-vn.vnet_subnet_id

  agw_id = "/subscriptions/b09a8b28-61e6-468f-b8f6-e45cc34b04e4/resourceGroups/MC_kubeResourceGroup_tuna_koreacentral/providers/Microsoft.Network/applicationGateways/aks"
  agw_subnet_id = module.example-vn.gateway_subnet_id
  attached_acr_id = module.tuna-acr.acr_id
}
