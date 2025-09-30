
output "snet_id" {
  description = "The ID of the subnet for the VM to be passed to compute module"
  value       = azurerm_subnet.snet.id
}


