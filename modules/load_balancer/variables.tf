# Load Balancer
variable "lb_name" {
  type = string
}
variable "location" {
  type = string
}
variable "rg_name" {
  type = string
}
variable "fe_ip_conf_name" {
  type = string
}
variable "fe_public_ip_address_id" {
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
