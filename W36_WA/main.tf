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

module "network" {
  source = "./modules/network"
  rg_name = var.rg_name
  snet_name = "mag-not-default-snet"
  
}