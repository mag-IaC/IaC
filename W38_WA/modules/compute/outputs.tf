
output "nsg_id" {
  value = azurerm_network_security_group.this.id
}

output "pip_address" {
  value = try(azurerm_public_ip.this[0].ip_address, null)
}

output "nginx_url" {
  value = try("http://${azurerm_public_ip.this[0].ip_address}", null)
}

output "vm_name" {
  value = azurerm_linux_virtual_machine.this.name
}

output "vm_id" {
  value = azurerm_linux_virtual_machine.this.id
}
