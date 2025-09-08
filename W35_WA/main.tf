terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.40.0"
    }
  }
}

provider "azurerm" {
  features {
  }
  subscription_id = local.config_var.subscription_id
}

resource "azurerm_resource_group" "rg" {
  name ="${local.prefix}rg${local.suffix}"
  location = "westeurope" #I hardcode this to show variables directly into main.tf
  tags = local.defaults.tags
}

resource "azurerm_application_load_balancer" "name" {
    resource_group_name = azurerm_resource_group.rg.name
    name = var.lb_name #Here we use a variable
    location = local.defaults.default_location
    tags = local.defaults.tags
}
