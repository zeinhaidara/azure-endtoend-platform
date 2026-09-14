module "networking" {
  source              = "../../modules/networking"
  name                = "northbridge-prod-vnet-zein818"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.northbridge.name
}

module "observability" {
  source              = "../../modules/observability"
  name                = "northbridge-prod-law-zein818"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.northbridge.name
  retention_in_days   = 90
}

module "key_vault" {
  source              = "../../modules/key-vault"
  name                = "nb-prod-kv-zein818"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.northbridge.name
  tenant_id           = var.tenant_id
}
