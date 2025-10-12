terraform {
  required_version = ">= 1.6.0"

  backend "azurerm" {
    # Values will be loaded from ../../shared/backend.hcl
    
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.40.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  use_cli         = true
}

# Logged-in context
data "azurerm_client_config" "current" {}

# Resource Group - simple example
resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
  tags     = {
    environment = var.environment
    created_by  = data.azurerm_client_config.current.object_id
  }
}

# Outputs
output "rg_name" {
  value = azurerm_resource_group.rg.name
}

output "rg_location" {
  value = azurerm_resource_group.rg.location
}
