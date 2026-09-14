output "api_client_id" {
  value = azurerm_user_assigned_identity.api.client_id
}

output "worker_client_id" {
  value = azurerm_user_assigned_identity.worker.client_id
}
