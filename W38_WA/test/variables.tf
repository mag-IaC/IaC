variable "rg_name" {
  description = "The name of the main resource group"
  type        = string
  default     = "mag-df-rg"
}

variable "location" {
  description = "Default Azure location"
  type        = string
  default     = "westeurope"
}

variable "vm_size" {
  description = "Size of the Virtual Machine"
  type        = string
  default     = "Standard_F2"
}

variable "vm_name" {
  description = "Default name for the VM"
  type        = string
  default     = "mag-df-vm"
}

variable "admin_user" {
  description = "Admin username for the VM"
  type        = string
}

variable "test_password" {
  description = "Admin password for the VM"
  type        = string
  sensitive   = true
}

variable "create_pip_boolean" {
  description = "Whether a Public IP should be created (true/false)"
  type        = bool
  default     = true
}

variable "enviroment" {
  description = "This module is used both by prod and dev"
  type        = string
  default     = "mag-df-test"
}

variable "owner" {
  description = "A tag describing the owner of the resource"
  type        = string
  default     = "none_specified"
}

variable "usage" {
  description = "A tag describing what the resource is used for"
  type        = string
  default     = "none_specified"
}

# VM image and OS disk settings
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
  default = {
    publisher            = "Canonical"
    offer                = "0001-com-ubuntu-server-jammy"
    sku                  = "22_04-lts"
    version              = "latest"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
}
