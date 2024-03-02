module "smoothpass-db" {
  source = "./database/smoothpass"
  location = "koreacentral"
  resource_group_name = module.smoothpass-k8s-rg.name

  administrator_login = var.db_administrator_login
  administrator_password = var.db_administrator_password

  delegated_subnet_id = module.smoothpass-k8s-network.private_db_subnet_id
  virtual_network_id = module.smoothpass-k8s-network.vnet_id
}

module "auth-db" {
  source = "./database/auth"
  location = "koreacentral"
  resource_group_name = module.smoothpass-k8s-rg.name

  administrator_login = var.db_administrator_login
  administrator_password = var.db_administrator_password

  delegated_subnet_id = module.smoothpass-k8s-network.private_db_subnet_id
  virtual_network_id = module.smoothpass-k8s-network.vnet_id
}

