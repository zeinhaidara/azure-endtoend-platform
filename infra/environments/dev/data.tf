data "azurerm_resource_group" "northbridge" {
  name = var.resource_group_name
}

data "azurerm_kubernetes_cluster" "shared" {
  name                = var.aks_name
  resource_group_name = var.platform_resource_group_name
}

data "azurerm_container_registry" "shared" {
  name                = var.acr_name
  resource_group_name = var.platform_resource_group_name
}
