output "storage_private_endpoint_id" {
  value = azurerm_private_endpoint.storage.id
}

output "key_vault_private_endpoint_id" {
  value = azurerm_private_endpoint.key_vault.id
}

output "sql_private_endpoint_id" {
  value = azurerm_private_endpoint.sql.id
}
