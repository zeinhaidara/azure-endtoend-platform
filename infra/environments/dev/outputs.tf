output "workload_identity_api_client_id" {
  value = module.workload_identity.api_client_id
}

output "workload_identity_worker_client_id" {
  value = module.workload_identity.worker_client_id
}

output "storage_account_name" {
  value = module.data.storage_account_name
}

output "key_vault_uri" {
  value = module.key_vault.vault_uri
}

