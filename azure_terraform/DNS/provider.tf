

terraform {

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
 #     version = "~> 3.0" # Adjust the version as needed
    }
  }
}


# Configure Azure Provider
provider "azurerm" {
  version = "2.74.0"
  features {}
}



