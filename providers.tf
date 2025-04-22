terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.26.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "sanofi-terraform-backend-rg"
    storage_account_name = "sanofiterraformstatestg"
    container_name       = "sanofi-terraform-state-container"
    key                  = "dev.tfstate"
  }
}

provider "azurerm" {
  features {
  }
  subscription_id = var.subscription_id
}
