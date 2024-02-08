module "tuna-acr" {
  source = "./acr"
  location = "koreacentral"
  acr_name = "smooothpassacr"
  resource_group_name = module.example-rg.name
}
