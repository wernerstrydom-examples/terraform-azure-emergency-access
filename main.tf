resource "azuread_group" "this" {
  display_name       = var.name
  assignable_to_role = true
  security_enabled   = true
  mail_enabled       = false
  description        = var.description
}

resource "azuread_directory_role" "global_administrator" {
  display_name = "Global Administrator"
}

resource "azuread_directory_role_assignment" "this" {
  role_id             = azuread_directory_role.global_administrator.template_id
  principal_object_id = azuread_group.this.object_id
}

data "azurerm_management_group" "this" {
  display_name = "Tenant Root Group"
}

locals {
  role_definition_names = [
    "Owner",
    "Storage Blob Data Contributor",
    "Key Vault Administrator",
  ]
}

resource "azurerm_role_assignment" "management_group" {
  for_each             = toset(local.role_definition_names)
  principal_id         = azuread_group.this.object_id
  role_definition_name = each.key
  scope                = data.azurerm_management_group.this.id
}

data "azuread_client_config" "this" {}

resource "azuread_group_member" "this" {
  for_each         = setunion(var.members, [data.azuread_client_config.this.object_id])
  group_object_id  = azuread_group.this.id
  member_object_id = each.value
}