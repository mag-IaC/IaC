output "nsg_id" {
  description = "The ID of the NSG"
  value       = azurerm_network_security_group.this.id
}

output "nsg_name" {
  description = "The name of the NSG"
  value       = azurerm_network_security_group.this.name
}
