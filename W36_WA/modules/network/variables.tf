variable "nsg_name" {
  description = "Name of network security group"
  type        = string
  default     = "mag-df-nsg-001"
}

variable "snet_name" {
  description = "subnet name"
  type        = string
  default     = "mag-df-snet-001"
}

variable "vnet_name" {
  description = "Variable for the virtual network name"
  type = string
  default     = "mag-df-vnet-001"
}

variable "location" {
    description = "default location"
    type = string
    default = "westeurope"
}

variable "rg_name" {
    description = "The rg-name that will used, this default does not exist and is changed higher up"
  default = "mag-df-rg-001"
}

variable "enviroment" {
  description = "This module is used both by prod and dev"
  default = "mag-df-test"
}
