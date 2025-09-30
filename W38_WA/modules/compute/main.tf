resource "azurerm_network_security_group" "this" {
  name                = "${var.prefix}-nsg"
  location            = var.location
  resource_group_name = var.rg_name

  security_rule {
    name                       = "${var.prefix}-ssh"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Public IP (created only if var.create_pip is true)
resource "azurerm_public_ip" "this" {
  count               = var.create_pip ? 1 : 0
  name                = "${var.prefix}-pip"
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_network_interface" "nic" {
  name                = "${var.prefix}-nic"
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "${var.prefix}-ipconfig"
    subnet_id                     = var.snet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.create_pip ? azurerm_public_ip.this[0].id : null
  }
}

# Associate NIC with NSG
resource "azurerm_network_interface_security_group_association" "nic_nsg" {
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = azurerm_network_security_group.this.id
}

# Virtual Machine
resource "azurerm_linux_virtual_machine" "vm" {
  name                  = var.vm_name
  location              = var.location
  resource_group_name   = var.rg_name
  size                  = var.vm_size
  admin_username        = var.admin_user
  network_interface_ids = [azurerm_network_interface.nic.id]

  admin_password = var.admin_password

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

  custom_data = base64encode(data.template_file.cloud_init.rendered)

}

data "template_file" "cloud_init" {
  template = file("./cloud-init.tpl")
  vars = {
    environment = var.enviroment
  }
}