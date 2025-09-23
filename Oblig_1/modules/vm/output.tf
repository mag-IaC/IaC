output "vm_name" {
  description = "The name of the virtual machine"
  value       = azurerm_linux_virtual_machine.vm_linux.name
}

output "vm_id" {
  description = "The resource ID of the virtual machine"
  value       = azurerm_linux_virtual_machine.vm_linux.id
}
