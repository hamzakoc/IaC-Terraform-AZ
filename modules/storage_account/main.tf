resource "azurerm_storage_account" "example" {
  name                     = var.sa_name
  resource_group_name      = var.rg_name
  location                 = var.location
  account_tier             = var.sa_account_tier
  account_replication_type = var.sa_account_replication_type
}
