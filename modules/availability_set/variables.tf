variable "availability_set_name" {
  type = string
}
variable "rg_name" {
  type = string
}
variable "location" {
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
