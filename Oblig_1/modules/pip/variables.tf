variable "prefix" {
  description = "Prefix for naming the public IP"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "rg_name" {
  description = "Resource group name"
  type        = string
}

variable "allocation_method" {
  description = "Allocation method for the public IP"
  type        = string
  default     = "Static"
}

variable "sku" {
  description = "SKU for the public IP (Basic or Standard)"
  type        = string
  default     = "Standard"
}
