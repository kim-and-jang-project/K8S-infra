terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.77.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

  # subscription_id = var.ARM_SUBSCRIPTION_ID
  # tenant_id       = var.ARM_TENANT_ID
}
