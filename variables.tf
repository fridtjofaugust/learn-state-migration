#####################
# Subscription
#####################
locals {
  unique   = substr("${var.subscriptionid}", -5, -1)
  subshort = replace("${var.subscriptionname}", "-", "")
}

variable "subscriptionid" {
  type = string
}

variable "subscriptionname" {
  type = string
}

variable "location" {
  type    = string
  default = "westeurope"
}

#####################
# Network
#####################
variable "vnetdns1" {
  type = string
}

variable "vnetdns2" {
  type = string
}

variable "vnetaddress" {
  type = string
}