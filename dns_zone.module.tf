module "tuna-dns-zone" {
  source = "./dns_zone"
  location = "koreacentral"

  resource_group_name = module.example-rg.name
  vnet_id = module.example-vn.vnet_id
  private_endpoint_Subnet = module.example-vn.private_endpoint_subnet_id
  acr_id = module.tuna-acr.acr_id
}
