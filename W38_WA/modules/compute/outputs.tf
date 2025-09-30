output "public_ip_address" {
  description = "The public IP address of the VM"
  value       = azurerm_public_ip.this.ip_address
}

output "nginx_url" {
  description = "URL for the NGINX homepage on the VM"
  value       = "http://${azurerm_public_ip.this.ip_address}"
}
