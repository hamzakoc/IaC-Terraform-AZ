variable "arm_frontend_instances" {
  type = number
}

variable "location" {
  type = string
}
variable "rg_name" {
  type = string
}
variable "subnet_id" {
  type = any
}
variable "nic_private_ip_address_allocation" {
  type = string
}
