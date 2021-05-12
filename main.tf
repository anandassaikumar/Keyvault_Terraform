data "azurerm_client_config" "current" {
}

data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

resource "azurerm_key_vault" "kv" {
  name                            = var.keyvault_name
  location                        = var.keyvault_location
  resource_group_name             = data.azurerm_resource_group.rg.name
  enabled_for_disk_encryption     = var.keyvault_disk_encryption
  tenant_id                       = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days      = var.keyvault_soft_delete_retention_days
  purge_protection_enabled        = var.keyvault_purge_protection
  enabled_for_deployment          = var.keyvault_enabled_for_deployment
  enabled_for_template_deployment = var.keyvault_enabled_for_template_deployment
  enable_rbac_authorization       = var.keyvault_enabled_Rbac_authorization
  sku_name = var.keyvault_sku
  dynamic "network_acls" {
    for_each = var.keyvault_network_acls
    content {
      bypass                     = network_acls.value["bypass"]
      default_action             = network_acls.value["default_action"]
      ip_rules                   = network_acls.value["ip_rules"]
      virtual_network_subnet_ids = network_acls.value["virtual_network_subnet_ids"]
    }
  }
  dynamic "access_policy" {
    for_each = var.keyvault_access_policy
    content {
      object_id               = access_policy.value["object_id"]
      tenant_id               = data.azurerm_client_config.current.tenant_id
      key_permissions         = access_policy.value["key_permissions"]
      certificate_permissions = access_policy.value["certificate_permissions"]
      secret_permissions      = access_policy.value["secret_permissions"]
    }
  }
}
