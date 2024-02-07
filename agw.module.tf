module "tuna-agw" {
  source = "./agw/tuna"
  location = "koreacentral"
  resource_group_name = module.tuna.node_resource_group_name
  gateway_subnet_id = module.example-vn.gateway_subnet_id
}
