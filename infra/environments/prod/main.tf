module "networking" {
  source              = "../../modules/networking"
  name                = "northbridge-prod-vnet"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.northbridge.name
}

module "observability" {
  source              = "../../modules/observability"
  name                = "northbridge-prod-law"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.northbridge.name
  retention_in_days   = 90
}

module "key_vault" {
  source              = "../../modules/key-vault"
  name                = "northbridge-prod-kv81"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.northbridge.name
  tenant_id           = var.tenant_id
}
