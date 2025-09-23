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
  type        = string
  default     = "mag-df-vnet-001"
}

variable "location" {
  description = "default location"
  type        = string
  default     = "westeurope"
}

variable "rg_name" {
  description = "The rg-name that will used, this default does not exist and is changed higher up"
  default     = "mag-df-rg-001"
}

variable "enviroment" {
  description = "This module is used both by prod and dev"
  default     = "mag-df-test"
}

variable "owner" {
  description = "A tag describing the owner of the resource"
  type = string
  default = "none_specified"
}

variable "usage" {
  description = "A tag describing what the resource is used for"
  default = "None specified"
  
}

variable "address_space" {
  description = "default value for address space"
  default     = ["10.0.0.0/16"]
}

variable "address_prefixes" {
  description = "default value for address prefixes"
  default     = ["10.0.2.0/24"]
}

