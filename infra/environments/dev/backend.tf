terraform {
  backend "azurerm" {
    resource_group_name  = "Moulaye-Haidara-8.18-RG"
    storage_account_name = "northbridgetfstatezein81"
    container_name       = "tfstate"
    key                  = "northbridge/dev.tfstate"
    use_azuread_auth     = true
  }
}
