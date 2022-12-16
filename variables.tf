
# Resource Group-------------------
variable "rg_name" {
  type = string
}
variable "location" {
  type = string
}


# Storage Account-------------------
variable "sa_name" {
  type = string
}
variable "sa_account_tier" {
  type = string
}
variable "sa_account_replication_type" {
  type = string
}



# Vnet-------------------
variable "vnet_name" {
  type = string
}
variable "vnet_address_space" {
  type = list(string)
}





# Subnet frontend------------------
variable "subnet_name_frontend" {
  type = string
}
variable "subnet_address_prefix_frontend" {
  type = list(string)
}

# Subnet backend------------------
variable "subnet_name_backend" {
  type = string
}
variable "subnet_address_prefix_backend" {
  type = list(string)
}

# Subnet dmz------------------
variable "subnet_name_dmz" {
  type = string
}
variable "subnet_address_prefix_dmz" {
  type = list(string)
}


# availability set------------------
variable "availability_set_name" {
  type = string
}
variable "availability_set_platform_fault_domain_count" {
  type = number
}
variable "availability_set_platform_update_domain_count" {
  type = number
}
variable "availability_set_managed" {
  type = bool
}
variable "availability_set_tags" {
  type = map(any)
}


# Storage Container
variable "arm_frontend_instances" {
  type = number
}

variable "container_access_type" {
  type = string
}


# NIC
variable "nic_private_ip_address_allocation" {
  type = string
}





# VM-------------------------------------

variable "vm_size" {
  type = string
}

variable "image_publisher" {
  type = string
}

variable "image_offer" {
  type = string
}
variable "image_sku" {
  type = string
}
variable "image_version" {
  type = string
}


variable "os_disk_caching" {
  type = string
}
variable "os_disk_create_option" {
  type = string
}
variable "os_disk_managed_disk_type" {
  type = string
}



variable "data_disk_managed_disk_type" {
  type = string
}
variable "data_disk_disk_size_gb" {
  type = number
}
variable "data_disk_create_option" {
  type = string
}
variable "data_disk_lun" {
  type = number
}



variable "admin_usename" {
  type = string
}
variable "admin_password" {
  type = string
}
# ----------------------------------




# PIP----------------------------------
variable "pip_name" {
  type = string
}

variable "pip_allocation_method" {
  type = string
}


# Load Balancer
variable "lb_name" {
  type = string
}

variable "fe_ip_conf_name" {
  type = string
}

variable "fe_private_ip_address_allocation" {
  type = string
}

# Load balancer Probe
variable "lb_probe_name" {
  type = string
}

variable "lb_probe_protocol" {
  type = string
}
variable "lb_probe_port" {
  type = number
}



# Load Balancer Rule
variable "lb_rule_name" {
  type = string
}

variable "lb_rule_protocol" {
  type = string
}
variable "lb_rule_frontend_port" {
  type = string
}
variable "lb_rule_backend_port" {
  type = string
}
variable "lb_rule_frontend_ip_configuration_name" {
  type = string
}


# Load Balancer backend address pool
variable "lb_backend_address_pool_name" {
  type = string
}
