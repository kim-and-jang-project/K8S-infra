module "tuna-database" {
  source = "./database/tuna"
  location = "koreacentral"
  resource_group_name = module.example-rg.name

  administrator_login = var.db_administrator_login
  administrator_password = var.db_administrator_password

  delegated_subnet_id = module.example-vn.private_db_subnet_id
  virtual_network_id = module.example-vn.vnet_id
}

module "auth-database" {
  source = "./database/auth"
  location = "koreacentral"
  resource_group_name = module.example-rg.name

  administrator_login = var.db_administrator_login
  administrator_password = var.db_administrator_password

  delegated_subnet_id = module.example-vn.private_db_subnet_id
  virtual_network_id = module.example-vn.vnet_id
}

