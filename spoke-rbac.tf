################################################
#  Create Resource Group
################################################
resource "azurerm_resource_group" "logicapp" {
  name     = "${var.subscriptionname}-logicapp"
  location = var.location
}


################################################
#  Create User Assigned Identity
################################################
resource "azurerm_user_assigned_identity" "costreport" {
  location            = var.location
  name                = "${var.subscriptionname}-costreport-uid"
  resource_group_name = azurerm_resource_group.logicapp.name
}


################################################
#  Add Cost management Reader RBAC tp scope
################################################
# resource "azurerm_role_assignment" "costmanagementreader" {
#   scope                = data.azurerm_management_group.we1nonproductionspokes.id
#   role_definition_name = "Cost Management Reader"
#   principal_id         = azurerm_user_assigned_identity.costreport.principal_id
# }





