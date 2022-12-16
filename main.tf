# // RG Modules
module "rg_canadacentral" {
  source   = "./modules/resource_group"
  rg_name  = var.rg_name
  location = var.location
}


module "storage_acc_cnd" {
  source                      = "./modules/storage_account"
  sa_name                     = var.sa_name
  rg_name                     = module.rg_canadacentral.name
  location                    = module.rg_canadacentral.location
  sa_account_tier             = var.sa_account_tier
  sa_account_replication_type = var.sa_account_replication_type
}


module "vnet_cnd" {
  source             = "./modules/vnet"
  vnet_name          = var.vnet_name
  rg_name            = module.rg_canadacentral.name
  location           = module.rg_canadacentral.location
  vnet_address_space = var.vnet_address_space
}


module "subnet_frontend_cnd" {
  source                  = "./modules/subnet"
  subnet_name             = var.subnet_name_frontend
  rg_name                 = module.rg_canadacentral.name
  vnet_name               = module.vnet_cnd.name
  subnet_address_prefixes = var.subnet_address_prefix_frontend
  depends_on = [
    module.vnet_cnd
  ]
}
module "subnet_backend_cnd" {
  source                  = "./modules/subnet"
  subnet_name             = var.subnet_name_backend
  rg_name                 = module.rg_canadacentral.name
  vnet_name               = module.vnet_cnd.name
  subnet_address_prefixes = var.subnet_address_prefix_backend
  depends_on = [
    module.vnet_cnd
  ]
}
module "subnet_dmz_cnd" {
  source                  = "./modules/subnet"
  subnet_name             = var.subnet_name_dmz
  rg_name                 = module.rg_canadacentral.name
  vnet_name               = module.vnet_cnd.name
  subnet_address_prefixes = var.subnet_address_prefix_dmz
  depends_on = [
    module.vnet_cnd
  ]
}


module "availability_set_cnd" {
  source                                        = "./modules/availability_set"
  availability_set_name                         = var.availability_set_name
  rg_name                                       = module.rg_canadacentral.name
  location                                      = module.rg_canadacentral.location
  availability_set_platform_fault_domain_count  = var.availability_set_platform_fault_domain_count
  availability_set_platform_update_domain_count = var.availability_set_platform_update_domain_count
  availability_set_managed                      = var.availability_set_managed
  availability_set_tags                         = var.availability_set_tags

}


module "storage_container_cnd" {
  source                 = "./modules/storage_container"
  sa_name                = module.storage_acc_cnd.name
  container_access_type  = var.container_access_type
  arm_frontend_instances = var.arm_frontend_instances
  depends_on = [
    module.storage_acc_cnd
  ]
}




module "nic_cnd" {
  source                            = "./modules/nic"
  arm_frontend_instances            = var.arm_frontend_instances
  rg_name                           = module.rg_canadacentral.name
  location                          = module.rg_canadacentral.location
  subnet_id                         = module.subnet_frontend_cnd.subnet_id_frontend3
  nic_private_ip_address_allocation = var.nic_private_ip_address_allocation
  depends_on = [
    module.subnet_frontend_cnd
  ]
}



module "vm_cnd" {
  source                      = "./modules/virtual_machine"
  rg_name                     = module.rg_canadacentral.name
  location                    = module.rg_canadacentral.location
  arm_frontend_instances      = var.arm_frontend_instances
  nic_ids                     = module.nic_cnd.id4
  vm_availability_set_id      = module.availability_set_cnd.id
  vm_size                     = var.vm_size
  image_publisher             = var.image_publisher
  image_offer                 = var.image_offer
  image_sku                   = var.image_sku
  image_version               = var.image_version
  os_disk_caching             = var.os_disk_caching
  os_disk_create_option       = var.os_disk_create_option
  os_disk_managed_disk_type   = var.os_disk_managed_disk_type
  data_disk_managed_disk_type = var.data_disk_managed_disk_type
  data_disk_disk_size_gb      = var.data_disk_disk_size_gb
  data_disk_create_option     = var.data_disk_create_option
  data_disk_lun               = var.data_disk_lun
  admin_usename               = var.admin_usename
  admin_password              = var.admin_password
  depends_on = [
    module.availability_set_cnd, module.nic_cnd
  ]
}



module "pip_cnd" {
  source                = "./modules/pip"
  pip_name              = var.pip_name
  rg_name               = module.rg_canadacentral.name
  location              = module.rg_canadacentral.location
  pip_allocation_method = var.pip_allocation_method
}


module "lb_cnd" {
  source                                 = "./modules/load_balancer"
  lb_name                                = var.lb_name
  location                               = module.rg_canadacentral.location
  rg_name                                = module.rg_canadacentral.name
  fe_ip_conf_name                        = var.fe_ip_conf_name
  fe_public_ip_address_id                = module.pip_cnd.id
  fe_private_ip_address_allocation       = var.fe_private_ip_address_allocation
  lb_probe_name                          = var.lb_probe_name
  lb_probe_protocol                      = var.lb_probe_protocol
  lb_probe_port                          = var.lb_probe_port
  lb_rule_name                           = var.lb_rule_name
  lb_rule_protocol                       = var.lb_rule_protocol
  lb_rule_frontend_port                  = var.lb_rule_frontend_port
  lb_rule_backend_port                   = var.lb_rule_backend_port
  lb_rule_frontend_ip_configuration_name = var.lb_rule_frontend_ip_configuration_name
  lb_backend_address_pool_name           = var.lb_backend_address_pool_name
}
