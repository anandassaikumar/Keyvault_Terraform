output "keyvault_id" {
  description = "The ID of the Key Vault"
  value = azurerm_key_vault.kv.id
}
output "keyvault_url" {
  description = "he URI of the Key Vault, used for performing operations on keys and secrets"
  value = azurerm_key_vault.kv.vault_uri
}
