terraform {
  required_version = ">= 1.3.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }

  cloud {
    organization = "Cloud-with-Mahin"

    workspaces {
      name = "terraform-hcp-cli-azure-storage-account"
    }
  }
}

provider "azurerm" {
  features {}
}