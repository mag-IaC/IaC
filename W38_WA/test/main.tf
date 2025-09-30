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
  features {}
}

# ------------------------
# Resource Group
# ------------------------
resource "azurerm_resource_group" "rg" {
  name     = "${local.naming_standards.prefix}${var.rg_name}${local.naming_standards.suffix}"
  location = var.location

  tags = local.tags
}

# ------------------------
# Network Module
# ------------------------
module "network" {
  source     = "../modules/network"
  rg_name    = azurerm_resource_group.rg.name
  location   = var.location
  enviroment = local.tags.environment
  # All other parameters are from defaults
}

# ------------------------
# Compute Module (VM + NSG + PIP)
# ------------------------


module "compute" {
  source        = "../modules/compute"
  rg_name       = azurerm_resource_group.rg.name
  location      = var.location
  snet_id       = module.network.snet_id

  vm_name       = "${local.naming_standards.prefix}${var.vm_name}${local.naming_standards.suffix}"
  vm_size       = var.vm_size
  admin_user    = "${local.naming_standards.prefix}${var.admin_user}"
  admin_password = var.test_password

  vm_references = var.vm_references
  create_pip    = var.create_pip_boolean

}
