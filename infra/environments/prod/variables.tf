variable "subscription_id" {
  type        = string
  description = "Azure subscription ID supplied by the pipeline."
}

variable "location" {
  type    = string
  default = "canadacentral"
}

variable "resource_group_name" {
  type        = string
  description = "Production resource group name."
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
