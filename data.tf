data "azurerm_key_vault" "example" {
  name                = "ganpati-key-vault"
  resource_group_name = "RG1"
}

data "azurerm_key_vault_secret" "username" {
  name         = "username"
  key_vault_id = data.azurerm_key_vault.example.id
}

data "azurerm_key_vault_secret" "password" {
  name         = "password"
  key_vault_id = data.azurerm_key_vault.example.id
}

