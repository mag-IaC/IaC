output "pip_id" {
  description = "The ID of the public IP passed on to other modules"
  value       = var.create_pip ? azurerm_public_ip.this[0].id : null
}

output "pip_address" {
  description = "The public IP address passed on to other modules"
  value       = var.create_pip ? azurerm_public_ip.this[0].ip_address : null
}


//chatGPT made this