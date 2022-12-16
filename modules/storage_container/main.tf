resource "azurerm_storage_container" "storage_container" {
  count                 = var.arm_frontend_instances
  name                  = "tf-storage-container-${count.index}"
  storage_account_name  = var.sa_name
  container_access_type = var.container_access_type
}
