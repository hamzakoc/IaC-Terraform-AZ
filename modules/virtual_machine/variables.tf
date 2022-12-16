
variable "rg_name" {
  type = string
}
variable "location" {
  type = string
}

variable "vm_size" {
  type = string
}

variable "vm_availability_set_id" {
  type = string
}

variable "nic_ids" {
  type = list(string)
}

variable "arm_frontend_instances" {
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



