output "blob_zone_id" {
  value = azurerm_private_dns_zone.this["blob"].id
}

output "vault_zone_id" {
  value = azurerm_private_dns_zone.this["vault"].id
}
