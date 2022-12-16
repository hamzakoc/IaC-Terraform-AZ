resource "azurerm_availability_set" "availability_set" {
  name                         = var.availability_set_name
  location                     = var.location
  resource_group_name          = var.rg_name
  platform_fault_domain_count  = var.availability_set_platform_fault_domain_count
  platform_update_domain_count = var.availability_set_platform_update_domain_count
  managed                      = var.availability_set_managed
  tags                         = var.availability_set_tags
}


