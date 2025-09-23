terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.40.0"
    }
  }
}
provider "azurerm" {

  subscription_id = local.subscription_id
  features {
  }
}

resource "azurerm_resource_group" "rg" {
  name     = "${local.naming_standards.prefix}${var.rg_name}${local.naming_standards.suffix}"
  location = var.location

  tags = local.tags
}


// Here all the modules begin

// 1. Make the network
// 2. Make the nsg
// 3. Make the pip
// 4. Make the vm
module "network" {
  source     = "../modules/network"
  rg_name    = azurerm_resource_group.rg.name
  location   = var.location
  enviroment = local.tags.environment
  owner = local.tags.owner
  #All other parameters are gotten from default values
}
module "nsg" {
  source   = "../modules/nsg"
  location = var.location
  rg_name  = azurerm_resource_group.rg.name
  owner = local.tags.owner
}
module "pip" {
  source   = "../modules/pip"
  location = var.location
  rg_name  = azurerm_resource_group.rg.name
  create_pip = var.create_pip_boolean  //When this is false, the IP is not created
  owner = local.tags.owner
}
module "vm" {
  source        = "../modules/vm"
  rg_name       = azurerm_resource_group.rg.name
  location      = var.location
  snet_id       = module.network.snet_id
  nsg_id        = module.nsg.nsg_id
  pip_id        = module.pip.pip_id
  vm_name       = "${local.naming_standards.prefix}${var.vm_name}${local.naming_standards.suffix}"
  vm_size       = var.vm_size
  admin_user    = "${local.naming_standards.prefix}${var.admin_user}"
  test_password = var.test_password
  enviroment    = local.tags.environment
  owner = local.tags.owner
}