

variable "location" {
  description = "default location"
  type        = string
  default     = "westeurope"
}

variable "rg_name" {
  description = "The rg-name that will used, this default does not exist and is changed higher up"
  default     = "mag-df-rg-001"
}

variable "nic_name" {
  description = "The network interface card name that will used, this default does not exist and is changed higher up"
  default     = "mag-df-nic-001"
}

variable "snet_id" {
  description = "value that will be gotten from out command when the vnet resource is created"
}

variable "vm_name" {
  description = "default name for the vm"
  default     = "mag-df-vm"

}

variable "admin_user" {
  default = "adminuser"

}


variable "vm_size" {
  description = "This should always be changed further down in the module"
  default     = "Standard_B2s" #Easy, small VM
}

variable "vm_references" {
  description = "Source image reference for the VM"
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


variable "enviroment" {
  description = "This module is used both by prod and dev"
  default     = "mag-df-test"
}

variable "pip_id" {
  description = "The ID of the public IP to associate with this NIC"
  type        = string
}


variable "test_password" {
  description = "default password, ONLY FOR TESTING"
  default     = "test_12345!ChangeDefault!"
}

variable "ip_config_name" {
  description = "Name for IP-config"
  type        = string
  default     = "ipconfig-df-mag-001"
}

variable "nsg_id" {
  description = "nsg_id gotten from the nsg module"
  type        = string
}

