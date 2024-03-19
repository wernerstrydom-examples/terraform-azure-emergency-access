terraform {
  required_version = ">= 1.5, < 2"
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = ">= 2, < 3"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3, < 4"
    }
  }
}