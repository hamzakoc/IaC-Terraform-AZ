
resource "azurerm_lb" "load_balancer" {
  name                = var.lb_name
  location            = var.location
  resource_group_name = var.rg_name
  frontend_ip_configuration {
    name                          = var.fe_ip_conf_name
    public_ip_address_id          = var.fe_public_ip_address_id
    private_ip_address_allocation = var.fe_private_ip_address_allocation
  }
}


resource "azurerm_lb_probe" "lb_probe" {
  name            = var.lb_probe_name
  loadbalancer_id = azurerm_lb.load_balancer.id
  protocol        = var.lb_probe_protocol
  request_path    = "/"
  port            = var.lb_probe_port
}

resource "azurerm_lb_rule" "lb_rule" {
  name                           = var.lb_rule_name
  loadbalancer_id                = azurerm_lb.load_balancer.id
  backend_address_pool_ids       = ["${azurerm_lb_backend_address_pool.lb_backend_address_pool.id}"]
  probe_id                       = azurerm_lb_probe.lb_probe.id
  protocol                       = var.lb_rule_protocol
  frontend_port                  = var.lb_rule_frontend_port
  backend_port                   = var.lb_rule_backend_port
  frontend_ip_configuration_name = var.lb_rule_frontend_ip_configuration_name
}



resource "azurerm_lb_backend_address_pool" "lb_backend_address_pool" {
  name            = var.lb_backend_address_pool_name
  loadbalancer_id = azurerm_lb.load_balancer.id
}
