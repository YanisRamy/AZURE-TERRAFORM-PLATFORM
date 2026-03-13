terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id                 = var.subscription_id
  resource_provider_registrations = "none"
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

module "network" {
  source              = "../../modules/network"
  vnet_name           = "vnet-${var.project_name}-${var.environment}"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/8"]
  aks_subnet_prefix   = ["10.240.0.0/16"]
  tags                = var.tags
}

module "acr" {
  source              = "../../modules/acr"
  acr_name            = "acr${var.project_name}${var.environment}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  sku                 = "Basic"
  tags                = var.tags
}

module "aks" {
  source              = "../../modules/aks"
  cluster_name        = "aks-${var.project_name}-${var.environment}"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  node_count          = var.node_count
  vm_size             = var.vm_size
  subnet_id           = module.network.aks_subnet_id
  acr_id              = module.acr.acr_id
  tags                = var.tags
}
