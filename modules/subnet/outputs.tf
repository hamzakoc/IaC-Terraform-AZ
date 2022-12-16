output "vnet_subnets" {
  description = ""
  value       = azurerm_subnet.subnet
}
# output "subnet_ids" {
#   description = ""
#   value       = values(azurerm_subnet.subnet)[*].id
# }
output "subnet_id_frontend" {
  value = one(azurerm_subnet.subnet[*].id)

}
output "subnet_id_frontend2" {
  value = azurerm_subnet.subnet.*.id

}
# output "subnet_address_prefixes" {
#   value = values(azurerm_subnet.subnet)[*].address_prefixes
# }

# output "subnet_address_prefix1" {
#   value = values(azurerm_subnet.subnet)[0].address_prefixes
# }
output "subnet_id_frontend3" {
  description = "ID of database subnet group"
  value       = concat(azurerm_subnet.subnet.*.id, [""])[0]
}
