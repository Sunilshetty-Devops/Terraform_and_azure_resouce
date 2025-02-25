terraform {

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0" # Adjust the version as needed
    }
  }
}

provider "azurerm" {
  features {} # This is the required block
}

