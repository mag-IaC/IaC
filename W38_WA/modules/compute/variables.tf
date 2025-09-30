variable "prefix" {
  description = "Prefix for resource names"
  type        = string
  default = "df-"
}

variable "location" {
  description = "Azure region"
  type        = string
  default = "westeurope"
}

variable "enviroment" {
  type = string
  default = "default"
  
}

variable "rg_name" {
  description = "Resource group name"
  type        = string
  default = "mag-df-rg-001"
}

variable "snet_id" {
  description = "Subnet ID for the NIC"
  type        = string
}

variable "create_pip" {
  description = "Whether to create a Public IP"
  type        = bool
  default     = true
}

variable "vm_name" {
  description = "Name of the Virtual Machine"
  type        = string
  default = "mag-df-vm-001"
}

variable "vm_size" {
  description = "Size of the Virtual Machine"
  type        = string
  default     = "Standard_B1s"
}

variable "admin_user" {
  description = "Admin username for the VM"
  type        = string
  default = "admin"
}

variable "admin_password" {
  description = "Admin password for the VM"
  type        = string
  sensitive   = true
}

variable "vm_references" {
  description = "Object containing VM image and OS disk settings"
  type = object({
    publisher            = string
    offer                = string
    sku                  = string
    version              = string
    caching              = string
    storage_account_type = string
  })
}
