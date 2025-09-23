resource "azurerm_network_interface" "nic" {
  name                = var.nic_name
  location            = var.location
  resource_group_name = var.rg_name
  

  ip_configuration {
    name                          = var.ip_config_name
    subnet_id                     = var.snet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = var.pip_id != null ? var.pip_id : null //chatGPT made this line

  }
}

resource "azurerm_network_interface_security_group_association" "nic_nsg" {
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = var.nsg_id
}


# Virtual Machine
resource "azurerm_linux_virtual_machine" "vm_linux" {
  name                = var.vm_name
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
    enviroment = var.enviroment
    owner = var.owner
    usage = var.usage
  }
}
