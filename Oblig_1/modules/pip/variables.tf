variable "pip_name" {
  description = "default name for pip"
  type        = string
  default     = "mag-df-pip-001"
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

//Added so we can manually deactivate pip
variable "create_pip" {
  description = "Whether to create a public IP for the VM"
  type        = bool
  default     = true
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
