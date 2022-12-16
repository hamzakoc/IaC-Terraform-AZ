
resource "azurerm_virtual_machine" "vm" {
  count                 = var.arm_frontend_instances
  name                  = "tf-instance-${count.index}"
  location              = var.location
  resource_group_name   = var.rg_name
  network_interface_ids = var.nic_ids
  vm_size               = var.vm_size
  availability_set_id   = var.vm_availability_set_id

  storage_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }

  storage_os_disk {
    name              = "tf-osdisk-${count.index}"
    caching           = var.os_disk_caching
    create_option     = var.os_disk_create_option
    managed_disk_type = var.os_disk_managed_disk_type
  }

  # Optional data disks
  storage_data_disk {
    name              = "tf-datadisk-${count.index}"
    managed_disk_type = var.data_disk_managed_disk_type
    disk_size_gb      = var.data_disk_disk_size_gb
    create_option     = var.data_disk_create_option
    lun               = var.data_disk_lun
  }

  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true

  os_profile {
    computer_name  = "tf-instance-${count.index}"
    admin_username = var.admin_usename
    admin_password = var.admin_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}
