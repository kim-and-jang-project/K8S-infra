module "smoothpass-acr-dns_zone" {
  source = "./dns_zone/smoothpass-acr"
  location = "koreacentral"

  resource_group_name = module.smoothpass-k8s-rg.name
  vnet_id = module.smoothpass-k8s-network.vnet_id
  private_endpoint_Subnet = module.smoothpass-k8s-network.private_endpoint_subnet_id
  acr_id = module.smoothpass-acr.acr_id
}
