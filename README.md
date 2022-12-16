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

tfsate file can be stored in a container on Azure Portal. 
It is stored locally by default




## terraform.tfvars file includes:
| Name | Version |
|------|---------|
rg_name  | "rg_canadacentral"
location | "canadacentral"
sa_name                     | "hmzkocstoragetest"
vnet_name          | "tf-vnet"
vnet_address_space | ["10.0.0.0/16"]
subnet_name_frontend          | "frontend"
subnet_address_prefix_frontend | ["10.0.1.0/24"]
subnet_name_backend            | "backend"
subnet_address_prefix_backend  | ["10.0.2.0/24"]
subnet_name_dmz                | "dmz"
subnet_address_prefix_dmz      |["10.0.3.0/24"]
availability_set_name                         | "tf-avail-set"
availability_set_platform_fault_domain_count  | 3
availability_set_platform_update_domain_count | 20
VM image              | "UbuntuServer"
pip_name              | "tf-public-ip"
pip_allocation_method | "Static"
lb_name                                | "tf-lb"
lb_rule_protocol                       | "Tcp"
lb_rule_frontend_port                  | 80

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.0.2 |
