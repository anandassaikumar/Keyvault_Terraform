variable "resource_group_name" {
  type        = string
  description = "Azure resource group name where the keyvault will be created"
}

variable "keyvault_name" {
  type        = string
  description = ""
}

variable "keyvault_location" {
  type        = string
  description = ""
}

variable "keyvault_disk_encryption" {
  type        = bool
  default     = false
  description = ""
}

variable "keyvault_soft_delete_retention_days" {
  type        = number
  default     = 90
  description = ""
}

variable "keyvault_purge_protection" {
  type        = bool
  default     = false
  description = ""
}

variable "keyvault_enabled_for_deployment" {
  type        = bool
  default     = false
  description = ""
}

variable "keyvault_enabled_for_template_deployment" {
  type        = bool
  default     = false
  description = ""
}

variable "keyvault_enabled_Rbac_authorization" {
  type        = bool
  default     = false
  description = ""
}

variable "keyvault_network_acls" {
  type = list(object({
    bypass                     = string
    default_action             = string
    ip_rules                   = list(string)
    virtual_network_subnet_ids = list(string)
  }))
  default = []
}

variable "keyvault_access_policy" {
  type = list(object({
    object_id               = string
    key_permissions         = list(string)
    certificate_permissions = list(string)
    secret_permissions      = list(string)
  }))
}

variable "keyvault_sku" {
  type = string
}
