variable "subscription_id" {
  type        = string
  description = "Azure subscription ID supplied by the pipeline."
}

variable "location" {
  type    = string
  default = "canadacentral"
}

variable "resource_group_name" {
  type    = string
  default = "Moulaye-Haidara-8.18-RG"
}

variable "platform_resource_group_name" {
  type    = string
  default = "Training-Batch-8.18"
}

variable "aks_name" {
  type    = string
  default = "aks-batch818"
}

variable "acr_name" {
  type    = string
  default = "batch818acr"
}

variable "tenant_id" {
  type        = string
  description = "Microsoft Entra tenant ID supplied by the pipeline."
}

variable "sql_admin_login" {
  type        = string
  description = "SQL administrator login supplied securely by the pipeline."
}

variable "sql_admin_password" {
  type        = string
  sensitive   = true
  description = "SQL administrator password supplied securely by the pipeline."
}
