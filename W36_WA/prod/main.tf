terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.40.0"
    }
  }
}

provider "azurerm" {

  subscription_id = local.config_var.subscription_id
  features {
  }
}

resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
}

//Using the resources that we have defined in our modules, this is PROD (but copied from dev)

module "network" {
  source     = "../modules/network"
  rg_name    = azurerm_resource_group.rg.name
  enviroment = var.enviroment


}

module "vm" {
  source     = "../modules/compute"
  rg_name    = azurerm_resource_group.rg.name
  snet_id    = module.network.snet_id
  vm_name    = var.vm_name
  vm_size    = var.vm_size #This will be different from dev and production
  enviroment = var.enviroment

}