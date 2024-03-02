module "smoothpass" {
  source = "./aks/smoothpass"
  location = "koreacentral"
  resource_group_name = module.smoothpass-k8s-rg.name
  pod_subnet_id = module.smoothpass-k8s-network.pod_subnet_id
  vnet_subnet_id = module.smoothpass-k8s-network.vnet_subnet_id
  pod_subnet_id_2 = module.smoothpass-k8s-network.pod_subnet_id_2
  agw_id = "/subscriptions/b09a8b28-61e6-468f-b8f6-e45cc34b04e4/resourceGroups/MC_kubeResourceGroup_tuna_koreacentral/providers/Microsoft.Network/applicationGateways/aks"
  agw_subnet_id = module.smoothpass-k8s-network.gateway_subnet_id
  attached_acr_id = module.smoothpass-acr.acr_id
}
