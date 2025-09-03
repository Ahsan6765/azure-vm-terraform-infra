output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

output "subnet_ids" {
  value = [for s in azurerm_subnet.subnet : s.id]
}

output "nsg_id" {
  value = azurerm_network_security_group.nsg.id
}
