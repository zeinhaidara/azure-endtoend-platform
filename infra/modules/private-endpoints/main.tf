resource "azurerm_private_endpoint" "storage" {
  name                = "${var.name}-storage-pe"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "${var.name}-storage-connection"
    private_connection_resource_id = var.storage_account_id
    is_manual_connection           = false
    subresource_names              = ["blob"]
  }

  private_dns_zone_group {
    name                 = "blob-dns-zone-group"
    private_dns_zone_ids = [var.storage_dns_zone_id]
  }
}

resource "azurerm_private_endpoint" "key_vault" {
  name                = "${var.name}-keyvault-pe"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "${var.name}-keyvault-connection"
    private_connection_resource_id = var.key_vault_id
    is_manual_connection           = false
    subresource_names              = ["vault"]
  }

  private_dns_zone_group {
    name                 = "vault-dns-zone-group"
    private_dns_zone_ids = [var.key_vault_dns_zone_id]
  }
}

resource "azurerm_private_endpoint" "sql" {
  name                = "${var.name}-sql-pe"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "${var.name}-sql-connection"
    private_connection_resource_id = var.sql_server_id
    is_manual_connection           = false
    subresource_names              = ["sqlServer"]
  }

  private_dns_zone_group {
    name                 = "sql-dns-zone-group"
    private_dns_zone_ids = [var.sql_dns_zone_id]
  }
}
