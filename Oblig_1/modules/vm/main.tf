


# Virtual Machine
resource "azurerm_linux_virtual_machine" "vm_linux" {
  name                = "${var.prefix}-vm"
  resource_group_name = var.rg_name
  location            = var.location
  size                = var.vm_size
  admin_username      = var.admin_user

  disable_password_authentication = false
  admin_password                  = var.test_password

  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  os_disk {
    caching              = var.vm_references.caching
    storage_account_type = var.vm_references.storage_account_type
  }

  source_image_reference {
    publisher = var.vm_references.publisher
    offer     = var.vm_references.offer
    sku       = var.vm_references.sku
    version   = var.vm_references.version
  }

  tags = {
    environment = var.enviroment
  }
}
