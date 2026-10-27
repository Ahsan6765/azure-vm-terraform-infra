terraform {
  required_version = ">= 1.6.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }

  # Remote backend configuration (Azure Storage)
  # backend "azurerm" {
  # }
}

provider "azurerm" {
  features {}
  subscription_id = "<SUBSCRIPTION_ID>"
}
