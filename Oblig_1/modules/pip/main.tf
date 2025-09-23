resource "azurerm_public_ip" "this" {
  count               = var.create_pip ? 1 : 0 //chatGPT came up with this
  name                = var.pip_name
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = var.allocation_method
  sku                 = var.sku

    tags = {
    enviroment = var.enviroment
    owner = var.owner
    usage = var.usage
  }
  
}
