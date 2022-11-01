##################################################
#  Deploy Resource Group
##################################################
resource "azurerm_resource_group" "network" {
  name     = "${var.subscriptionname}-network"
  location = var.location
}

##################################################
#  Create network watcher
##################################################
resource "azurerm_network_watcher" "network" {
  name                = "${azurerm_resource_group.network.name}-networkwatcher"
  location            = var.location
  resource_group_name = azurerm_resource_group.network.name
}

#####################
# Create VNET
#####################
resource "azurerm_virtual_network" "network" {
  name                = "${var.subscriptionname}-network-vnet"
  location            = azurerm_resource_group.network.location
  resource_group_name = azurerm_resource_group.network.name
  address_space       = [var.vnetaddress]
  dns_servers         = [var.vnetdns1, var.vnetdns2]
}


#####################
# Subnet01
#####################
resource "azurerm_subnet" "subnet01" {
  name                 = "subnet01"
  resource_group_name  = azurerm_resource_group.network.name
  virtual_network_name = azurerm_virtual_network.network.name
  address_prefixes     = [cidrsubnet(var.vnetaddress, 2, 0)] # can add numbers to octet, to keep unique
}

#####################
# Subnet02
#####################
resource "azurerm_subnet" "subnet02" {
  name                 = "subnet02"
  resource_group_name  = azurerm_resource_group.network.name
  virtual_network_name = azurerm_virtual_network.network.name
  address_prefixes     = [cidrsubnet(var.vnetaddress, 2, 1)] # can add numbers to octet, to keep unique
}

#####################
# Subnet03
#####################
resource "azurerm_subnet" "Subnet03" {
  name                 = "subnet03"
  resource_group_name  = azurerm_resource_group.network.name
  virtual_network_name = azurerm_virtual_network.network.name
  address_prefixes     = [cidrsubnet(var.vnetaddress, 2, 2)] # can add numbers to octet, to keep unique
}