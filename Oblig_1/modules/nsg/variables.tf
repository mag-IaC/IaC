
variable "location" {
  description = "location..."
  type        = string
}

variable "nsg_name" {
  description = "default name for nsg"
  type        = string
  default     = "mag-df-nsg-001"
}

variable "rg_name" {
  description = "Resource group name"
  type        = string
}

variable "security_rules" {
  description = "List of security rules to apply to the NSG"
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))

  # Default rule to allow SSH from anywhere, but we change this in the root module (to only allow our computers)
  default = [
    {
      name                       = "SSH"
      priority                   = 1001
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  ]

  
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