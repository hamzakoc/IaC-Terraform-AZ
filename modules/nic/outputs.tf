# output "id" {
#   value = azurerm_network_interface.nic.id
# }

# output "id2" {
#   value = one(azurerm_network_interface.nic[0].id)

# }
# output "id3" {
#   value       = concat(azurerm_network_interface.nic.*.id, [""])[0]
# }

# output "id4" {
#   value = values(azurerm_network_interface.nic).id
# }



output "id4" {
  value = toset([for v in azurerm_network_interface.nic : v.id])
}
