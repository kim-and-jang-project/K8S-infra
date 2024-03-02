terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.77.0"
    }
  }
  backend "azurerm" {
      resource_group_name = "kubeResourceGroup"
      storage_account_name = "smoothtfstatestorage" #Azure Storage 계정 이름
      container_name = "tfstate" #블롭 컨테이너의 이름
      key = "terraform.tfstate" #상태저장소 파일 이름
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

  # subscription_id = var.ARM_SUBSCRIPTION_ID
  # tenant_id       = var.ARM_TENANT_ID
}
