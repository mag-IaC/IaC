terraform {
  required_version = ">= 1.6.0"

  backend "azurerm" {
    resource_group_name  = "rg-tfstate-mag2412"  
    storage_account_name = "sttfstatemag1234"     
    container_name       = "tfstate"
    key                  = "projects/oblig2/terraform.tfstate"
    access_key = "KO131KipZ9o4p4q8a+pzogEC36XcbevEhvJoqtJBSYS6Rkz3LCL/3VcsBdP+dSUJBmVOierINBaa+AStiJPa8w==" #found with the command az storage account keys list `--resource-group rg-tfstate-mag2412  --account-name sttfstatemag2412 --query "[0].value" -o tsv

  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.40.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
}
provider "azurerm" {
  features {}
  subscription_id = local.subscription_id
}

#rg

resource "azurerm_resource_group" "rg" {
  name     = local.rg_name
  location = var.location

  tags = {
    Environment = var.environment
    Project     = var.project_name
  }
}

#sa

module "storage_account" {
  source = "./modules/sa"

  environment       = var.environment
  location          = var.location
  resource_group    = azurerm_resource_group.rg.name
  project_name      = var.project_name
  storage_tier      = var.storage_tier
  replication_type  = var.replication_type
  name              = local.storage_account
}