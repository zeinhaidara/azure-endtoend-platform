module "networking" {
  source              = "../../modules/networking"
  name                = "northbridge-dev-vnet-zein818"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.northbridge.name
}

module "observability" {
  source              = "../../modules/observability"
  name                = "northbridge-dev-law-zein818"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.northbridge.name
}

module "key_vault" {
  source              = "../../modules/key-vault"
  name                = "nb-dev-kv-zein818"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.northbridge.name
  tenant_id           = var.tenant_id
}

module "data" {
  source               = "../../modules/data"
  storage_account_name = "nbdevdatazein818"
  location             = var.location
  resource_group_name  = data.azurerm_resource_group.northbridge.name
}
