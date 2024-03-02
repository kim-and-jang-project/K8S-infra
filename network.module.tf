module "smoothpass-k8s-network" {
  source = "./virtualNetwork/smoothpass-k8s"
  location = "koreacentral"
  resource_group_name = module.smoothpass-k8s-rg.name
}
