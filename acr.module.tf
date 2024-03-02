module "smoothpass-acr" {
  source = "./acr/smoothpass"
  location = "koreacentral"
  acr_name = "smooothpass"
  resource_group_name = module.smoothpass-k8s-rg.name
}
