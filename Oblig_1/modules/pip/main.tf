resource "azurerm_public_ip" "this" {
  name                = "${var.prefix}-pip"
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = var.allocation_method
  sku                 = var.sku
}
