variable "rg_name" {
  description = "The name of the main resource group"
  type        = string
  default     = "mag-df-rg"

}

variable "location" {
  description = "default location"
  type        = string
  default     = "westeurope"
}

variable "enviroment" {
  description = "This module is used both by prod and dev"
  default     = "mag-df-test"
}

variable "vm_size" {
  description = "This should always be changed further down in the module"
  default     = "Standard_F2" #Easy, small VM
}

variable "vm_name" {
  description = "default name for the vm"
  default     = "mag-df-vm"

}

