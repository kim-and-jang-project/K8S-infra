locals {
  backend_address_pool_name      = "backend_pool"
  frontend_port_name             = "front-port"
  frontend_ip_configuration_name = "front-eip"
  http_setting_name              = "http-setting"
  listener_name                  = "http-listener"
  request_routing_rule_name      = "routing-rule"
  redirect_configuration_name    = "redirect-config"
}

resource "azurerm_public_ip" "agw" {
  name                = "agw-ip"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"
  sku		      = "Standard"
}

resource "azurerm_application_gateway" "aks" {
  name                = "aks"
  resource_group_name = var.resource_group_name
  location            = var.location

  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = "my-gateway-ip-configuration"
    subnet_id = var.gateway_subnet_id
  }

  frontend_port {
    name = local.frontend_port_name
    port = 80
  }

  frontend_ip_configuration {
    name                 = local.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.agw.id
  }

  backend_address_pool {
    name = local.backend_address_pool_name
  }

  backend_http_settings {
    name                  = local.http_setting_name
    cookie_based_affinity = "Disabled"
    path                  = "/"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
  }

  http_listener {
    name                           = local.listener_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = local.request_routing_rule_name
    priority                   = 9
    rule_type                  = "Basic"
    http_listener_name         = local.listener_name
    backend_address_pool_name  = local.backend_address_pool_name
    backend_http_settings_name = local.http_setting_name
  }

  lifecycle {
    ignore_changes = [
      tags, 
      backend_address_pool, 
      backend_http_settings, 
      http_listener, 
      probe, 
      request_routing_rule,
      ssl_certificate,
      redirect_configuration,
      frontend_port,
      sku,
      autoscale_configuration
    ]
  }
}
