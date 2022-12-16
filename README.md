# IaC Terraform Azure
## Modules
- Resource group
- Storage Account
- Storage Container
- Virtual Machine
- Availability set
- Load balancer
- Network interface card
- Public IP
- Vnet
- Subnet



This module will use a specific Azure storage account as a backend to keep our terraform.tfstate . You can change the storage account from the "backend.tf" file to your desired location.



## Variables:
| Name | Version |
|------|---------|
rg_name  = "rg_canadacentral"
location = "canadacentral"
sa_name                     = "hmzkocstoragetest"
sa_account_tier             = "Standard"
sa_account_replication_type = "LRS"
vnet_name          = "tf-vnet"
vnet_address_space = ["10.0.0.0/16"]
subnet_name_frontend           = "frontend"
subnet_address_prefix_frontend = ["10.0.1.0/24"]
subnet_name_backend            = "backend"
subnet_address_prefix_backend  = ["10.0.2.0/24"]
subnet_name_dmz                = "dmz"
subnet_address_prefix_dmz      = ["10.0.3.0/24"]
availability_set_name                         = "tf-avail-set"
availability_set_platform_fault_domain_count  = 3
availability_set_platform_update_domain_count = 20
availability_set_managed                      = true
availability_set_tags = {
  "environment" = "Production"
}
arm_frontend_instances = 2
container_access_type  = "private"
nic_private_ip_address_allocation = "Dynamic"
# VM
vm_size                     = "Standard_DS1_v2"
image_publisher             = "Canonical"
image_offer                 = "UbuntuServer"
image_sku                   = "16.04-LTS"
image_version               = "latest"
os_disk_caching             = "ReadWrite"
os_disk_create_option       = "FromImage"
os_disk_managed_disk_type   = "Standard_LRS"
data_disk_managed_disk_type = "Standard_LRS"
data_disk_disk_size_gb      = "1023"
data_disk_create_option     = "Empty"
data_disk_lun               = 0
admin_usename               = "hamza"
admin_password              = "HamzaTest1234."

# PIP
pip_name              = "tf-public-ip"
pip_allocation_method = "Static"


# Load Balancer

lb_name                                = "tf-lb"
fe_ip_conf_name                        = "default"
fe_private_ip_address_allocation       = "dynamic"
lb_probe_name                          = "tf-lb-probe-80"
lb_probe_protocol                      = "Http"
lb_probe_port                          = 80
lb_rule_name                           = "tf-lb-rule-80"
lb_rule_protocol                       = "Tcp"
lb_rule_frontend_port                  = 80
lb_rule_backend_port                   = 80
lb_rule_frontend_ip_configuration_name = "default"
lb_backend_address_pool_name           = "tf-lb-pool"






You can see the providers, resources, inputs and outputs more detailed in the chart below. 


## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.0.2 |
