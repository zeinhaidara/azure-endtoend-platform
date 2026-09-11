module "networking" {
  source              = "../../modules/networking"
  name                = "northbridge-dev-vnet"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.northbridge.name
}

module "observability" {
  source              = "../../modules/observability"
  name                = "northbridge-dev-law"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.northbridge.name
}

module "key_vault" {
  source              = "../../modules/key-vault"
  name                = "northbridge-dev-kv81"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.northbridge.name
  tenant_id           = var.tenant_id
}
