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
  #"appId": "ee01fdc1-bf7a-44b5-8d0e-bf23ff23a2f2",
  #  "displayName": "azure-cli-2024-10-30-09-55-14",
  #  "password": "n_P8Q~tcdrwOP0WCktvGnk2Uu.sGQ4IGbnoyHdzY",
  #  "tenant": "acad6b2a-1914-4080-b289-0079c8e2662f"

  client_id     = "ee01fdc1-bf7a-44b5-8d0e-bf23ff23a2f2"
  client_secret = "n_P8Q~tcdrwOP0WCktvGnk2Uu.sGQ4IGbnoyHdzY"
  tenant_id     = "acad6b2a-1914-4080-b289-0079c8e2662f"

}

