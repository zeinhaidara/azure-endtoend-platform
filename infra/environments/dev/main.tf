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
module "private_dns" {
  source              = "../../modules/private-dns"
  name                = "northbridge-dev-dns-zein818"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.northbridge.name
  virtual_network_id  = module.networking.vnet_id
}

module "private_endpoints" {
  source                = "../../modules/private-endpoints"
  name                  = "northbridge-dev-pe-zein818"
  location              = var.location
  resource_group_name   = data.azurerm_resource_group.northbridge.name
  subnet_id             = module.networking.private_endpoint_subnet_id
  storage_account_id    = module.data.storage_account_id
  storage_dns_zone_id   = module.private_dns.blob_zone_id
  key_vault_id          = module.key_vault.id
  key_vault_dns_zone_id = module.private_dns.vault_zone_id
}
