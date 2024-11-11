terraform {
  required_providers {
    docker = {
       source  = "kreuzwerker/docker"
       version = ">= 2.13.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.7.0"
    }
    nginx = {
      source  = "getstackhead/nginx"
      version = "1.3.2"
    }

  }
}

provider "docker" {
  # Configuration options
}

provider "azurerm" {
  features {}
}

provider "nginx" {
  # Configuration options
}


