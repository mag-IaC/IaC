output "resource_group_name" {
  description = "The name of the resource group created"
  value       = azurerm_resource_group.rg.name
}

output "nsg_id" {
  description = "The ID of the network security group"
  value       = module.compute.nsg_id
}

output "pip_address" {
  description = "The public IP address of the VM (if created)"
  value       = module.compute.pip_address
  sensitive   = false //Solution from gpt => does not fail if no pip is created.
}

output "vm_name" {
  description = "The name of the virtual machine"
  value       = module.compute.vm_name
}

output "vm_id" {
  description = "The resource ID of the virtual machine"
  value       = module.compute.vm_id
}

output "admin_username" {
  description = "Admin username for the VM"
  value       = var.admin_user
  sensitive   = false
}

