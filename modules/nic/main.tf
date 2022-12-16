resource "azurerm_network_interface" "nic" {
  count               = var.arm_frontend_instances
  name                = "tf-interface-${count.index}"
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "tf-ip-${count.index}"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.nic_private_ip_address_allocation
  }
}




