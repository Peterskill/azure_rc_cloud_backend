terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "03.58.0"
    }
  }
}

provider "azurerm" {
  skip_provider_registration = true
  features {}
}
