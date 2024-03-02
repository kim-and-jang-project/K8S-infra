module "smoothpass-ingress-agw" {
  source = "./agw/smoothpass"
  location = "koreacentral"
  resource_group_name = module.smoothpass-k8s-rg.name
  gateway_subnet_id = module.smoothpass-k8s-network.gateway_subnet_id
}
