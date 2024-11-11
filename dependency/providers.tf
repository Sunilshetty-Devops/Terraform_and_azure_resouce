terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0" # Adjust the version as needed
    }
  }
}

provider "azurerm" {
  /*
subscriptions_id    = "445332c4-72cb-46a2-8cf3-8f396dc088ae"
client_id 	    = "ee01fdc1-bf7a-44b5-8d0e-bf23ff23a2f2"
arm_client_secreate = "n_P8Q~tcdrwOP0WCktvGnk2Uu.sGQ4IGbnoyHdzY"
tenant              = "acad6b2a-1914-4080-b289-0079c8e2662f"
*/
  features {} # This is the required block

}

terraform {
    cloud {

      organization = "abc_terreaform_registry_demo"

      workspaces {
        name = "workspace_project1"
      }
    }
}


